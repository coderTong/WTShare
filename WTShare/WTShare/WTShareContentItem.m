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
