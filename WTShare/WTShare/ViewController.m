//
//  ViewController.m
//  WTShare
//
//  Created by Mac on 16/6/30.
//  Copyright © 2016年 wutong. All rights reserved.
//

#import "ViewController.h"

#import "WTShareManager.h"
#import "WTShareContentItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)shareTo:(UIButton *)sender {
    
    if (sender.tag == WTShareTypeWeiBo) {
        
        [WTShareManager wt_shareWithContent:[WTShareContentItem shareWTShareContentItem] shareType:WTShareTypeWeiBo shareResult:^(NSString *shareResult) {
            NSLog(@"🐒🐒🐒🐒🐒🐒---%@", shareResult);
        }];
        
    }else if (sender.tag == WTShareTypeQQ){
        [WTShareManager wt_shareWithContent:[WTShareContentItem shareWTShareContentItem] shareType:WTShareTypeQQ shareResult:^(NSString *shareResult) {
            NSLog(@"🐒🐒🐒🐒🐒🐒---%@", shareResult);
        }];
    }else if (sender.tag == WTShareTypeQQZone){
        [WTShareManager wt_shareWithContent:[WTShareContentItem shareWTShareContentItem] shareType:WTShareTypeQQZone shareResult:^(NSString *shareResult) {
            NSLog(@"🐒🐒🐒🐒🐒🐒---%@", shareResult);
        }];
    }else if (sender.tag == WTShareTypeWeiXinTimeline){
        [WTShareManager wt_shareWithContent:[WTShareContentItem shareWTShareContentItem] shareType:WTShareTypeWeiXinTimeline shareResult:^(NSString *shareResult) {
            NSLog(@"🐒🐒🐒🐒🐒🐒---%@", shareResult);
        }];
    }else if (sender.tag == WTShareTypeWeiXinSession){
        [WTShareManager wt_shareWithContent:[WTShareContentItem shareWTShareContentItem] shareType:WTShareTypeWeiXinSession shareResult:^(NSString *shareResult) {
            NSLog(@"🐒🐒🐒🐒🐒🐒---%@", shareResult);
        }];
    }else if (sender.tag == WTShareTypeWeiXinFavorite){
        [WTShareManager wt_shareWithContent:[WTShareContentItem shareWTShareContentItem] shareType:WTShareTypeWeiXinFavorite shareResult:^(NSString *shareResult) {
            NSLog(@"🐒🐒🐒🐒🐒🐒---%@", shareResult);
        }];
    }
    
    
    
}

@end
