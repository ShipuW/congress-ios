//
//  BaseOperation.m
//  congress
//
//  Created by 王士溥 on 11/24/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import "BaseOperation.h"

@implementation BaseOperation

- (id)initWithDelegate:(id<BaseOperationDelegate>)delegate
                opInfo:(NSDictionary *)opInfo
{
    self = [super init];
    if (self) {
        _delegate = delegate;
        _opInfo = opInfo;
        _totalLength = 0;
    }
    
    return self;
}

- (void)cancelOp
{
    if (_connection != nil) {
        BASE_INFO_FUN(@"_connection dealloc cancel");
        [_connection cancel];
    }
    _connection = nil;
}

- (void)dealloc
{
    if (_connection != nil) {
        BASE_INFO_FUN(@"_connection dealloc cancel");
        [_connection cancel];
    }
    _connection = nil;
    _delegate = nil;
}

- (NSTimeInterval)timeoutInterval
{
    return RequestTimeout;
}

- (NSMutableURLRequest *)urlRequest
{
    NSString *urlString = [_opInfo objectForKey:@"url"];
    id body = [_opInfo objectForKey:@"body"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    BASE_INFO_FUN(urlString);
    
    if (body != nil) {
        [request setHTTPMethod:HTTPPOST];
        if ([body isKindOfClass:[NSString class]]) {
            [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
            BASE_INFO_FUN(body);
        }
        else
            [request setHTTPBody:body];
    }
    else {
        [request setHTTPMethod:HTTPGET];
    }
    [request setTimeoutInterval:[self timeoutInterval]];
    
    return request;
}

- (void)executeOp
{
    _connection = [[NSURLConnection alloc] initWithRequest:[self urlRequest] delegate:self];
}

- (void)parseData:(NSData *)data
{
    if (data.length <= 0) { //返回的长度为0，认为成功
        [self parseSuccess:nil];
        return;
    }
    
    NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    int count = (int) [dict objectForKey:NetCount];
    if (count > 0) {
        [self parseSuccess:dict];
    }
    else {
        [self parseFail:dict];
    }
    
    _receiveData = nil;
}

- (void)parseSuccess:(NSDictionary *)dict
{
    [_delegate opSuccess:dict];
}

- (void)parseProgress:(long long)receivedLength
{
    
}

- (void)parseFail:(NSDictionary *)dict
{
    if ([dict isKindOfClass:[NSString class]]) {
        [_delegate opFail:(NSString *)dict];
        return;
    }
    
    [_delegate opFail:[dict objectForKey:@""]];
}


#pragma mark - NSURLConnectionDelegate methods

- (void)connection:(NSURLConnection *)aConnection didReceiveResponse:(NSURLResponse *)aResponse
{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)aResponse;
    
    NSString *statusCode = [NSString stringWithFormat:@"%ld",(long)[response statusCode]];
    
    _statusCode = [statusCode intValue];
    _receiveData = [[NSMutableData alloc] init];
    
    if (_statusCode ==200 || _statusCode == 206) {
        _totalLength = [response expectedContentLength];
    }
    
    BASE_INFO_FUN(statusCode);
}

- (void)connection:(NSURLConnection *)aConn didReceiveData:(NSData *)data
{
    BASE_INFO_FUN(([NSString stringWithFormat:@"%lu", (unsigned long)data.length]));
    [_receiveData appendData:data];
    [self parseProgress:_receiveData.length];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConn
{
    BASE_INFO_FUN([[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding]);
    
    // 成功接受：200有数据，204没有数据，206断点续传
    if (_statusCode == 200 || _statusCode == 204 || _statusCode == 206) {
        [self parseData:_receiveData];
    }
    else {
        
        NSString *errorMessage = [[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding];
        
        if (errorMessage.length <= 0) {
            errorMessage = [[NSString alloc] initWithFormat:@"ResponseCode:%ld", (long)_statusCode];
        }
        
        [self parseFail:errorMessage];
    }
    
    _connection = nil;
    _receiveData = nil;
}

- (void)connection:(NSURLConnection *)aConn didFailWithError:(NSError *)error
{
    [self parseFail:[error localizedDescription]];
    
    _connection = nil;
    _receiveData = nil;
}


-(void)jsonToDict{
    //创建URL对象
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@"]];
    //创建请求
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    //发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        /*
         第一个参数:要解析的二进制数据
         第二个参数:解析json的选项
         NSJSONReadingMutableContainers = (1UL << 0), 最外层是可变的字典和数组
         NSJSONReadingMutableLeaves = (1UL << 1),     里面的字符串也是可变的,iOS7
         NSJSONReadingAllowFragments = (1UL << 2)     最外层既不是字典也不是数组
         kNilOptions为什么都没有
         第三个参数:错误信息
         */
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
    }];
}

@end
