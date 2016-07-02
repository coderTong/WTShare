//
//  WTShareManager.h
//  WTShare
//
//  Created by Mac on 16/7/1.
//  Copyright © 2016年 wutong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WeiboSDK.h"
#import "WXApi.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterfaceObject.h>
#import <TencentOpenAPI/QQApiInterface.h>

@class WTShareContentItem;

typedef NS_ENUM(NSInteger, WTShareType) {
    WTShareTypeWeiBo = 0,   // 新浪微博
    WTShareTypeQQ,          // QQ好友
    WTShareTypeQQZone,      // QQ空间
    WTShareTypeWeiXinTimeline,// 朋友圈
    WTShareTypeWeiXinSession,// 微信朋友
    WTShareTypeWeiXinFavorite,// 微信收藏
};

typedef NS_ENUM(NSInteger, WTShareWeiXinErrCode) {
    WTShareWeiXinErrCodeSuccess = 0,   // 新浪微博
    WTShareWeiXinErrCodeCancel = -2,          // QQ好友
    
};

typedef void(^WTShareResultlBlock)(NSString * shareResult);

@interface WTShareManager : NSObject <WBHttpRequestDelegate,WeiboSDKDelegate,WXApiDelegate,TencentSessionDelegate>



+ (instancetype)shareWTShareManager;
// 判断QQ分享是否成功
+ (void)didReceiveTencentUrl:(NSURL *)url;
+ (void)wt_shareWithContent:(WTShareContentItem *)contentObj shareType:(WTShareType)shareType shareResult:(WTShareResultlBlock)shareResult;


@end
