//
//  Constant.h
//  congress
//
//  Created by 王士溥 on 11/24/16.
//  Copyright © 2016 shipu. All rights reserved.
//

#ifndef Constant_h
#define Constant_h


#if (DEBUG || TESTCASE)
#define FxLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define FxLog(format, ...)
#endif

// 日志输出宏
#define BASE_LOG(cls,sel) FxLog(@"%@-%@",NSStringFromClass(cls), NSStringFromSelector(sel))
#define BASE_ERROR_LOG(cls,sel,error) FxLog(@"ERROR:%@-%@-%@",NSStringFromClass(cls), NSStringFromSelector(sel), error)
#define BASE_INFO_LOG(cls,sel,info) FxLog(@"INFO:%@-%@-%@",NSStringFromClass(cls), NSStringFromSelector(sel), info)

// 日志输出函数
#if (DEBUG || TESTCASE)
#define BASE_LOG_FUN()         BASE_LOG([self class], _cmd)
#define BASE_ERROR_FUN(error)  BASE_ERROR_LOG([self class],_cmd,error)
#define BASE_INFO_FUN(info)    BASE_INFO_LOG([self class],_cmd,info)
#else
#define BASE_LOG_FUN()
#define BASE_ERROR_FUN(error)
#define BASE_INFO_FUN(info)
#endif

// 设备类型判断
#define IsiPad     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IsiPhone   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IsRetain   ([[UIScreen mainScreen] scale] >= 2.0)
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define ScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define ScreenMaxLength (MAX(ScreenWidth, ScreenHeight))
#define ScreenMinLength (MIN(ScreenWidth, ScreenHeight))

#define IsiPhone4   (IsiPhone && ScreenMaxLength < 568.0)
#define IsiPhone5   (IsiPhone && ScreenMaxLength == 568.0)
#define IsiPhone6   (IsiPhone && ScreenMaxLength == 667.0)
#define IsiPhone6P  (IsiPhone && ScreenMaxLength == 736.0)

// 消息通知
#define RegisterNotify(_name, _selector)                \
[[NSNotificationCenter defaultCenter] addObserver:self  \
selector:_selector name:_name object:nil];

#define RemoveNofify            \
[[NSNotificationCenter defaultCenter] removeObserver:self];

#define SendNotify(_name, _object)  \
[[NSNotificationCenter defaultCenter] postNotificationName:_name object:_object];

#define MAIN_URL CloneUrl
#define BaseUrl @"https://congress.api.sunlightfoundation.com/"
#define CloneUrl @"http://104.198.0.197:8080/"
#define CongressKey @"&apikey=f50631fa532e41608c78662065118da7"
#define LEGISLATOR_URL @"legislators?"
#define BILL_URL @"bills?"
#define COMMITTEE_URL @"committees?"
#define ChamberFilter @"&chamber="
#define ActiveFilterTrue @"&history.active=true"
#define ActiveFilterFalse @"&history.active=false"
#define ALLDATAFILTER @"&per_page=all"
#define NUMBERFILTER50 @"&per_page=50&page=1"
#define ImageUrl @"https://theunitedstates.io/images/congress/original/"
#define TwitterUrl @"https://twitter.com/"
#define FacebookUrl @"https://www.facebook.com/"
#define HTTPGET             @"GET"
#define HTTPPOST            @"POST"
#define RequestTimeout    10

#define ImageSuffix @".jpg"


#define NetResults @"results"
#define NetCount @"count"

#define LEG_TAB_NAME @"legislators"
#define BIL_TAB_NAME @"bills"
#define COM_TAB_NAME @"committees"

#define STATE_TAB_NAME @"state"
#define HOUSE_TAB_NAME @"house"
#define SENATE_TAB_NAME @"senate"
#define JOINT_TAB_NAME @"joint"

#define FAVORITE_CATEGORY @"local"

#define ACTIVE_TAB_NAME @"active"
#define NEW_TAB_NAME @"new"

#define SAVE_LEG_KEY @"legislatorSaveKey"
#define SAVE_BIL_KEY @"billSaveKey"
#define SAVE_COM_KEY @"committeeSaveKey"

#define ViewTextBlack [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0f];
#define Leftbar_Background_Color [UIColor colorWithRed:241/255.0 green:248/255.0 blue:233/255.0 alpha:1.0f];
#define Leftbar_Text_Color [UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1.0f];

// 消息通知Key
#define NofifyNewsIcon      @"NewImage"
#define AddLegNotice        @"addLegNotification"
#define AddBilNotice        @"addBilNotification"
#define AddComNotice        @"addComNotification"

#define LABEL_CELL_ID       @"LabelTableViewCell"
#define BUTTON_CELL_ID       @"ButtonTableViewCell"

#define LINK_BUTTON_SUFFIX  @"LINK"

#endif /* Constant_h */
