//
//  BaseOperation.h
//  congress
//
//  Created by 王士溥 on 11/24/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseOperationDelegate;
@interface BaseOperation : NSObject{
    id<BaseOperationDelegate> _delegate;
    
    NSURLConnection         *_connection;
    NSMutableData           *_receiveData;
    NSInteger               _statusCode;
    long long               _totalLength;
    
@public
    NSDictionary            *_opInfo;
}



- (id)initWithDelegate:(id<BaseOperationDelegate>)delegate
                opInfo:(NSDictionary *)opInfo;
- (NSMutableURLRequest *)urlRequest;
- (void)executeOp;
- (void)cancelOp;
- (void)parseData:(id)data;
- (void)parseSuccess:(NSDictionary *)dict;
- (void)parseFail:(id)dict;
- (void)parseProgress:(long long)receivedLength;
- (NSTimeInterval)timeoutInterval;

@end


@protocol BaseOperationDelegate <NSObject>

- (void)opSuccess:(id)data;
- (void)opFail:(NSString *)errorMessage;

@optional


@end
