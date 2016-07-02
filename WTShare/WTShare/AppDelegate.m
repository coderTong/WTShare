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
