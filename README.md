# 为什么我用原生的分享?
#### 主要一个原因是如果不想把自己的appKey暴露给第三方
### 第二一个就是如果用第三方的app的体积会比原生接入的大那么10MB左右吧(我当初在公司用过,记得用友盟的分享打包出来,比用原生接入的app体积大了10MB左右.)
 <br />
下面是集成微博,微信,qq具体步奏,和一些坑点
 <br />

# 一.材料准备
首先我们需要调料有 (点击链接下载~)
[新浪微博sdk](https://github.com/sinaweibosdk/weibo_ios_sdk.git)
[腾讯sdk](http://qzonestyle.gtimg.cn/qzone/vas/opensns/res/doc/iOS_SDK_V3.1.0.zip)
[微信sdk](https://res.wx.qq.com/open/zh_CN/htmledition/res/dev/download/sdk/WeChatSDK1.7.1.zip)

- 新浪微微博我们需要的文件如图箭头所指
![Snip20160702_1.png](http://upload-images.jianshu.io/upload_images/571446-01c89b71ac04fde8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 微信我们需要的文件如下图箭头所指
![Snip20160702_2.png](http://upload-images.jianshu.io/upload_images/571446-74be5b23c5a2ca8d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- QQ分享我们需要的文件如下

![Snip20160702_3.png](http://upload-images.jianshu.io/upload_images/571446-eb259154f6971437.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



# 二.将我们需要的文件放到工程中去
#### 1.进入工程文件文件夹
![Snip20160702_5.png](http://upload-images.jianshu.io/upload_images/571446-0d7a656921ef9334.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 2.新建Lib文件夹
> 说明:</br>1.下载下来的微信Sdk中我们需要的"OpenSDK1.7.1"文件下面的所有文件我们将"OpenSDK1.7.1"文件直接复制到我们新建的Lib文件,但是为了区分我会将文件夹名称修改为"WeChatSDK_1.7.1" </br>2.QQ的分享我们只需要"TencentOpenAPI.framework"这个文件,但是我们还是要给他新建一个自己的文件夹"Tencent3.1.0" </br>3.新浪微博我们就直接将libWeiboSDK文件夹复制到Lib文件夹下面就ok了!

如图

![Snip20160702_6.png](http://upload-images.jianshu.io/upload_images/571446-57d4760615a23a91.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


### 3.将Lib文件夹添加到工程中去

![Snip20160702_7.png](http://upload-images.jianshu.io/upload_images/571446-251dac85b1a4d7de.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![Snip20160702_8.png](http://upload-images.jianshu.io/upload_images/571446-e4b5e105200d2ee2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![Snip20160702_9.png](http://upload-images.jianshu.io/upload_images/571446-48aab99fa56af2f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

# 三.添加SDK依赖的系统库文件

"3333"表示新浪微博,qq,微信都依赖的
#### 1.微博依赖的系统库文件
> "1"QuartzCore.framework       // 独有
"2"ImageIO.framework          // 独有
"3"SystemConfiguration.framework  "3333"
"4"Security.framework           "共同------QQ和微博"
"5"CoreTelephony.framework      "共同------QQ和微博"
"6"CoreText.framework
"7"CoreGraphics.framework       "共同------QQ和微博"
"8"libz.dylib                  "33333"
"9"libsqlite3.dylib            "33333"


#### 2.微信
>SystemConfiguration.framework,"333"
libz.dylib,"3333"
libsqlite3.0.dylib,"3333"
libc++.dylib。// 独有


#### 3.QQ
> "1"”Security.framework”,  "共同-----QQ和微博"
"2"“libiconv.dylib”，// 独有
"3"“SystemConfiguration.framework”，"共同-----3"
"4"“CoreGraphics.Framework”、"共同------QQ和微博"
"5"“libsqlite3.dylib”、"共同-------3"
"6"“CoreTelephony.framework”、"共同-----QQ和微博"
"7"“libstdc++.dylib”、// 独有
"8"“libz.dylib”"共同-----3"

#### 4.总共我们需要添加的系统库文件
> "1"”Security.framework”
"2"“libiconv.dylib”
"3"“SystemConfiguration.framework”，
"4"“CoreGraphics.Framework”、
"5"“libsqlite3.dylib”
"6"“CoreTelephony.framework”
"7"“libstdc++.dylib”
"8"“libz.dylib”
"9"libc++.dylib
"10"QuartzCore.framework
"11"ImageIO.framework
"12"CoreText.framework

#### 5.添加系统库文件例子
- 以添加CoreText.framework为例,如下图

![Snip20160702_10.png](http://upload-images.jianshu.io/upload_images/571446-096276cf156733bb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20160702_11.png](http://upload-images.jianshu.io/upload_images/571446-2f1c4ba12107e05a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#### 6.新建framework文件夹
- 添加到项目中的系统库文件会自动放在工程文件的最顶上面如图

![Snip20160702_12.png](http://upload-images.jianshu.io/upload_images/571446-3f64c966a9dbab42.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 新建framework文件将所有系统库文件放在里面

![Snip20160702_13.png](http://upload-images.jianshu.io/upload_images/571446-40cb20a15cb192bb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

# 四.添加 -ObjC,编译选项
> 在工程中引入静态库之后,需要在编译时添加 -ObjC,编译选项避免静态库中类加载不全造成程序崩溃. </br>方法:Target->Build Settings->Linking下 Other Linker Flags 项添加 -ObjC


![Snip20160702_14.png](http://upload-images.jianshu.io/upload_images/571446-6897cb139a5fac25.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

# 五.添加白名单

> iOS 9开始系统策略更新，限制了http协议的访问，此外应用需要在“Info.plist”中将要使用的URL Schemes列为白名单，才可正常检查其他应用是否安装。</br> 所以为了正常跳转到微信,微博,qq,我们需要在Info.plist,中添加如下代码

```objc
<key>LSApplicationQueriesSchemes</key>
	<array>
		<string>sinaweibohd</string>
		<string>sinaweibo</string>
		<string>sinaweibosso</string>
		<string>weibosdk</string>
		<string>weibosdk2.5</string>
		<string>mqqapi</string>
		<string>mqq</string>
		<string>mqqOpensdkSSoLogin</string>
		<string>mqqconnect</string>
		<string>mqqopensdkdataline</string>
		<string>mqqopensdkgrouptribeshare</string>
		<string>mqqopensdkfriend</string>
		<string>mqqopensdkapi</string>
		<string>mqqopensdkapiV2</string>
		<string>mqqopensdkapiV3</string>
		<string>mqzoneopensdk</string>
		<string>wtloginmqq</string>
		<string>wtloginmqq2</string>
		<string>mqqwpa</string>
		<string>mqzone</string>
		<string>mqzonev2</string>
		<string>mqzoneshare</string>
		<string>wtloginqzone</string>
		<string>mqzonewx</string>
		<string>mqzoneopensdkapiV2</string>
		<string>mqzoneopensdkapi19</string>
		<string>mqzoneopensdkapi</string>
		<string>mqzoneopensdk</string>
		<string>alipay</string>
		<string>alipayshare</string>
	</array>
```

流程图如下

![Snip20160702_18.png](http://upload-images.jianshu.io/upload_images/571446-2cd8600e55952195.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![Snip20160702_19.png](http://upload-images.jianshu.io/upload_images/571446-0ba8d4b126041e5a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



![Snip20160702_20.png](http://upload-images.jianshu.io/upload_images/571446-f1faaaaf35b23de5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


- 如果没有添加白名单,就可能出现,明明手机上已经安装了微博,分享时却说:"未安装微博客户端,是否现在去下载?" 如下图.

![sddsds.jpg](http://upload-images.jianshu.io/upload_images/571446-2a6631ef8925a8d8.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

[添加白名单,文案参考](http://www.jianshu.com/p/a8cce94d508e)

# 六.代码实现

> 我是用一个WTShareManager 统一管理微信,微博,QQ三者的分享 </br> 在WTShareManager 里面统一注册三者的app,并遵守三者的代理协议,然后三者分享时所需要的Image, title,url,summary, 用WTShareContentItem管理.外界根据WTShareManager 的WTShareType,然后传入WTShareContentItem进行各渠道的分享.

- WTShareManager.h

```objc
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

```

- WTShareManager.m

```objc
//
//  WTShareManager.m
//  WTShare
//
//  Created by Mac on 16/7/1.
//  Copyright © 2016年 wutong. All rights reserved.
//

#import "WTShareManager.h"
#import "WTShareContentItem.h"



#define kAppKey         @"2045436852"
#define kRedirectURI    @"http://www.sina.com"
#define kWeixinAppId    @"wxd930ea5d5a258f4f"
#define kTencentAppId   @"222222"

#define kWTShareQQSuccess @"0"
#define kWTShareQQFail      @"-4"

@interface WTShareManager ()
{
    TencentOAuth *_tencentOAuth;
}
@property (nonatomic, copy)WTShareResultlBlock shareResultlBlock;
@end

@implementation WTShareManager

static WTShareManager * _instence;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instence = [super allocWithZone:zone];
        [_instence setRegisterApps];
    });
    return _instence;
}
+ (instancetype)shareWTShareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instence = [[self alloc]init];
        [_instence setRegisterApps];
    });
    return _instence;
}
- (id)copyWithZone:(NSZone *)zone
{
    return _instence;
}


// 注册appid
- (void)setRegisterApps
{
    // 注册Sina微博
    [WeiboSDK registerApp:kAppKey];
    // 微信注册
    [WXApi registerApp:kWeixinAppId];
    
    // 注册QQ
    _tencentOAuth = [[TencentOAuth alloc]initWithAppId:kTencentAppId andDelegate:self];
}



#pragma mark - 分享方法------
+ (void)wt_shareWithContent:(WTShareContentItem *)contentObj shareType:(WTShareType)shareType shareResult:(WTShareResultlBlock)shareResult
{
    WTShareManager * shareManager = [WTShareManager shareWTShareManager];
    shareManager.shareResultlBlock = shareResult;
    
    [self wt_shareWithContent:contentObj shareType:shareType];
}
+ (void)wt_shareWithContent:(WTShareContentItem *)contentObj shareType:(WTShareType)shareType
{
    [WTShareManager shareWTShareManager];
    
    switch (shareType) {
        case WTShareTypeWeiBo:
        {
            WBMessageObject *message = [WBMessageObject message];
            message.text = contentObj.sinaSummary;
            
            if(contentObj.bigImage){
                WBImageObject *webpage = [WBImageObject object];
                webpage.imageData =  UIImageJPEGRepresentation(contentObj.bigImage, 1.0f);
                
                message.imageObject = webpage;
            }
            
            WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
            
            [WeiboSDK sendRequest:request];
            break;
        }
        case WTShareTypeQQ:
        {
            NSString * shareTitle = [NSString string];
            shareTitle = contentObj.qqTitle ? contentObj.qqTitle : contentObj.title;
            
            //分享跳转URL
            NSString *urlt = contentObj.urlString;
            QQApiNewsObject * newsObj ;
            
            if (contentObj.urlImageString) {
                newsObj   = [QQApiNewsObject objectWithURL:[NSURL URLWithString:urlt] title:shareTitle description:contentObj.summary previewImageURL:[NSURL URLWithString:contentObj.urlImageString]];
            }else if(contentObj.thumbImage){
                // 如果分享的是图片的话 不能太大所以如果后台过来的的图片太大的话 可以调节如下的倍数
                NSData *imageData = UIImageJPEGRepresentation(contentObj.thumbImage, 1.0);
                newsObj = [QQApiNewsObject objectWithURL:[NSURL URLWithString:urlt] title:shareTitle description:contentObj.summary previewImageData:imageData];
            }
            
            SendMessageToQQReq *req = [[SendMessageToQQReq alloc]init];
            req.message = newsObj;
            req.type = ESENDMESSAGETOQQREQTYPE;
            //将内容分享到qq
            [QQApiInterface sendReq:req];
            
            
            break;
            
        }
        case WTShareTypeQQZone:
        {
            //分享跳转URL
            NSString *urlt = contentObj.urlString;
            
            QQApiNewsObject * newsObj ;
            if (contentObj.urlImageString) {
                newsObj   = [QQApiNewsObject objectWithURL:[NSURL URLWithString:urlt] title:contentObj.title description:contentObj.summary previewImageURL:[NSURL URLWithString:contentObj.urlImageString]];
            }else if(contentObj.thumbImage){
                
                NSData * imageData = UIImagePNGRepresentation(contentObj.thumbImage);
                
                newsObj = [QQApiNewsObject objectWithURL:[NSURL URLWithString:urlt] title:contentObj.title description:contentObj.summary previewImageData:imageData];
            }
            
            SendMessageToQQReq *req = [[SendMessageToQQReq alloc]init];
            req.message = newsObj;
            req.type = ESENDMESSAGETOQQREQTYPE;
        
            [QQApiInterface SendReqToQZone:req];
            break;
            
            break;
        }
        case WTShareTypeWeiXinTimeline: // 微信朋友圈
        {
            WXMediaMessage * message = [WXMediaMessage message];
            message.title = contentObj.weixinPyqtitle.length >0 ? contentObj.weixinPyqtitle : contentObj.title;
            [message setThumbImage:contentObj.thumbImage];
            message.description = contentObj.summary;
            WXWebpageObject * ext = [WXWebpageObject object];
            ext.webpageUrl = contentObj.urlString;
            message.mediaObject = ext;
            SendMessageToWXReq * req = [[SendMessageToWXReq alloc]init];
            req.bText = NO;
            req.message = message;
            req.scene = WXSceneTimeline;
            [WXApi sendReq:req];

            
            break;
        }
        case WTShareTypeWeiXinSession:
        {
            WXMediaMessage * message = [WXMediaMessage message];
            message.title = contentObj.title;
            
            [message setThumbImage:contentObj.thumbImage];
            message.description = contentObj.summary;
            WXWebpageObject * ext = [WXWebpageObject object];
            ext.webpageUrl = contentObj.urlString;
            message.mediaObject = ext;
            
            SendMessageToWXReq *req = [[SendMessageToWXReq alloc]init];
            req.bText = NO;
            req.message = message;
            req.scene = WXSceneSession;
            [WXApi sendReq:req];
            
            break;
        }
        case WTShareTypeWeiXinFavorite:
        {
            WXMediaMessage * message = [WXMediaMessage message];
            message.title = contentObj.title;
            
            [message setThumbImage:contentObj.thumbImage];
            message.description = contentObj.summary;
            WXWebpageObject * ext = [WXWebpageObject object];
            ext.webpageUrl = contentObj.urlString;
            message.mediaObject = ext;
            
            SendMessageToWXReq *req = [[SendMessageToWXReq alloc]init];
            req.bText = NO;
            req.message = message;
            req.scene = WXSceneFavorite;
            [WXApi sendReq:req];
            break;
        }
    
        default:
            break;
    }
}


#pragma mark - WeiboSDKDelegate 从新浪微博那边分享过来传回一些数据调用的方法
/**
 收到一个来自微博客户端程序的请求
 
 收到微博的请求后，第三方应用应该按照请求类型进行处理，处理完后必须通过 [WeiboSDK sendResponse:] 将结果回传给微博
 @param request 具体的请求对象
 */
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request{}
/**
 收到一个来自微博客户端程序的响应
 
 收到微博的响应后，第三方应用可以通过响应类型、响应的数据和 WBBaseResponse.userInfo 中的数据完成自己的功能
 @param response 具体的响应对象
 */
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    /**
     
     WeiboSDKResponseStatusCodeSuccess               = 0,//成功
     WeiboSDKResponseStatusCodeUserCancel            = -1,//用户取消发送
     WeiboSDKResponseStatusCodeSentFail              = -2,//发送失败
     WeiboSDKResponseStatusCodeAuthDeny              = -3,//授权失败
     WeiboSDKResponseStatusCodeUserCancelInstall     = -4,//用户取消安装微博客户端
     WeiboSDKResponseStatusCodePayFail               = -5,//支付失败
     WeiboSDKResponseStatusCodeShareInSDKFailed      = -8,//分享失败 详情见response UserInfo
     WeiboSDKResponseStatusCodeUnsupport             = -99,//不支持的请求
     WeiboSDKResponseStatusCodeUnknown               = -100,
     */
    
    if (response.statusCode == WeiboSDKResponseStatusCodeSuccess) {
        //NSLog(@"微博----分享成功!!!");
        self.shareResultlBlock(@"微博----分享成功!!!");
        
    }else if(response.statusCode == WeiboSDKResponseStatusCodeUserCancel)
    {
//        NSLog(@"微博----用户取消发送");
        self.shareResultlBlock(@"微博----用户取消发送");
    }else if (response.statusCode == WeiboSDKResponseStatusCodeSentFail){
//        NSLog(@"微博----发送失败!");
        self.shareResultlBlock(@"微博----发送失败!");
    }
    
     
//    NSLog(@"%@", response);
}


#pragma mark - WXApiDelegate 从微信那边分享过来传回一些数据调用的方法


/*! @brief 发送一个sendReq后，收到微信的回应
 *
 * 收到一个来自微信的处理结果。调用一次sendReq后会收到onResp。
 * 可能收到的处理结果有SendMessageToWXResp、SendAuthResp等。
 * @param resp具体的回应内容，是自动释放的
 */
-(void) onResp:(BaseResp*)resp
{
    
    // 成功回来
    // errCode  0
    // type     0
    
    // 取消分享回来
    // errCode -2
    // type 0
    
    if (resp.errCode == WTShareWeiXinErrCodeSuccess) {
//        NSLog(@"微信----分享成功!!");
        self.shareResultlBlock(@"微信----分享成功!!");
    }else{
//        NSLog(@"微信----用户取消分享!!");
        self.shareResultlBlock(@"微信----用户取消分享!!");
    }
//    NSLog(@"%@", resp);
     
}

#pragma mark - 判断qq是否分享成功
+ (void)didReceiveTencentUrl:(NSURL *)url
{
    NSString * urlStr = url.absoluteString;
    NSArray * array = [urlStr componentsSeparatedByString:@"error="];
    if (array.count > 1) {
        NSString * lastStr = [array lastObject];
        NSArray * lastStrArray = [lastStr componentsSeparatedByString:@"&"];
        
        NSString * resultStr = [lastStrArray firstObject];
        if ([resultStr isEqualToString:kWTShareQQSuccess]) {
//            NSLog(@"QQ------分享成功!");
            [WTShareManager shareWTShareManager].shareResultlBlock(@"QQ------分享成功!");
        }else if ([resultStr isEqualToString:kWTShareQQFail]){
//            NSLog(@"QQ------分享失败!");
            [WTShareManager shareWTShareManager].shareResultlBlock(@"QQ------分享失败!");
        }
        
    }
     
}

@end

```


WTShareContentItem.h
```objc
//
//  WTShareContentItem.h
//  WTShare
//
//  Created by Mac on 16/7/1.
//  Copyright © 2016年 wutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WTShareContentItem : NSObject
@property (strong, nonatomic) UIImage *thumbImage;
@property (strong, nonatomic) UIImage *bigImage;
@property (strong, nonatomic) NSString *imageType;
@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) NSString *weixinPyqtitle;
@property (strong, nonatomic) NSString *qqTitle;

@property (strong, nonatomic) NSString *urlString;//
@property (strong, nonatomic) NSString *urlImageString;// QQ,QQ空间分享加载图片用的
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *type;

@property (nonatomic, assign)BOOL isImageShareQQ; // yes 代表用图片 NO代表用URL
@property (nonatomic, strong)NSString * sinaSummary;


+ (WTShareContentItem *)shareWTShareContentItem;

@end

```

WTShareContentItem.m
```objc
//
//  WTShareContentItem.m
//  WTShare
//
//  Created by Mac on 16/7/1.
//  Copyright © 2016年 wutong. All rights reserved.
//

#import "WTShareContentItem.h"

@implementation WTShareContentItem


+ (WTShareContentItem *)shareWTShareContentItem
{
    WTShareContentItem * item = [[WTShareContentItem alloc]init];
    item.title = @"分享测试";
    item.thumbImage = [UIImage imageNamed:@"tu"];
    item.bigImage = [UIImage imageNamed:@"tu"];
    item.summary = @"哈哈哈哈哈哈哈哈哈2!!!";
    item.urlString = @"https://www.baidu.com";
    item.sinaSummary = @"一般情况新浪微博的Summary和微信,QQ的是不同的,新浪微博的是一般带链接的,而且总共字数不能超过140字";
    return item;
}


@end


```

AppDelegate.m
```objc
//
//  AppDelegate.m
//  WTShare
//
//  Created by Mac on 16/6/30.
//  Copyright © 2016年 wutong. All rights reserved.
//

#import "AppDelegate.h"
#import "WTShareManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


#pragma mark - 从别的应用回来

// iOS9 以上用这个方法接收
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    NSDictionary * dic = options;
    NSLog(@"%@", dic);
    if ([options[UIApplicationOpenURLOptionsSourceApplicationKey] isEqualToString:@"com.sina.weibo"]) {
        NSLog(@"新浪微博~");
    
        return [WeiboSDK handleOpenURL:url delegate:[WTShareManager shareWTShareManager]];
    }else if ([options[UIApplicationOpenURLOptionsSourceApplicationKey] isEqualToString:@"com.tencent.xin"]){
        
        return [WXApi handleOpenURL:url delegate:[WTShareManager shareWTShareManager]];
    }else if ([options[UIApplicationOpenURLOptionsSourceApplicationKey] isEqualToString:@"com.tencent.mqq"]){
        
        [WTShareManager didReceiveTencentUrl:url];
        return [TencentOAuth HandleOpenURL:url];
    }
    return YES;
}
// iOS9 以下用这个方法接收
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"%@",url);
    
    
    if ([sourceApplication isEqualToString:@"com.sina.weibo"]) {
        
        return [WeiboSDK handleOpenURL:url delegate:[WTShareManager shareWTShareManager]];
        
    }else if ([sourceApplication isEqualToString:@"com.tencent.xin"]){
        
        return [WXApi handleOpenURL:url delegate:[WTShareManager shareWTShareManager]];
        
    }else if ([sourceApplication isEqualToString:@"com.tencent.mqq"]){
     
        [WTShareManager didReceiveTencentUrl:url];
        return [TencentOAuth HandleOpenURL:url];
    }
    
    
    return YES;
}





- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




@end

```

# 六.坑点
- QQ错误, 说找不到_TencentApiInterfaceDelegate代理
Undefined symbols for architecture armv7:
  "l_OBJC_PROTOCOL_$_TencentApiInterfaceDelegate", referenced from:
      l_OBJC_$_PROTOCOL_REFS_TencentSessionDelegate in WTShareManager.o
ld: symbol(s) not found for architecture armv7
clang: error: linker command failed with exit code 1 (use -v to see invocation)


![Snip20160702_16.png](http://upload-images.jianshu.io/upload_images/571446-5813a13fcd8dbea6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20160702_15.png](http://upload-images.jianshu.io/upload_images/571446-ca98366a00d84263.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 解决办法
> 在TencentOpenAPI.framework 里面找到TencentOAuth.h文件,然后在里面包含#import "TencentApiInterface.h" 文件OK了.
![Snip20160702_17.png](http://upload-images.jianshu.io/upload_images/571446-853b1ef1284fe4ce.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

[答案出处. 感谢大神"月子木"](http://blog.csdn.net/lilianyou163/article/details/50554394)

