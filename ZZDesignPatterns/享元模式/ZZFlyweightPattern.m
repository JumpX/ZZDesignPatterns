//
//  ZZFlyweightPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZFlyweightPattern.h"
#import "ZZWebSiteFactory.h"
#import "ZZFlyweightWebSite.h"

@implementation ZZFlyweightPattern

+ (void)show
{
    ZZWebSiteFactory *factory = [ZZWebSiteFactory new];
    
    ZZFlyweightWebSite *webSiteX =  [factory webSiteWithKey:@"网站"];
    [webSiteX loadUser:[ZZFlyweightUser userWithName:@"赵丽颖"]];
    
    ZZFlyweightWebSite *webSiteY =  [factory webSiteWithKey:@"网站"];
    [webSiteY loadUser:[ZZFlyweightUser userWithName:@"黄渤"]];
    
    ZZFlyweightWebSite *webSiteZ =  [factory webSiteWithKey:@"网站"];
    [webSiteZ loadUser:[ZZFlyweightUser userWithName:@"周星驰"]];
    
    ZZFlyweightWebSite *webSiteA =  [factory webSiteWithKey:@"博客"];
    [webSiteA loadUser:[ZZFlyweightUser userWithName:@"YY大神"]];
    
    ZZFlyweightWebSite *webSiteB =  [factory webSiteWithKey:@"博客"];
    [webSiteB loadUser:[ZZFlyweightUser userWithName:@"AFNetworking大神"]];
    
    ZZFlyweightWebSite *webSiteC =  [factory webSiteWithKey:@"博客"];
    [webSiteC loadUser:[ZZFlyweightUser userWithName:@"SDWebImage大神"]];

    NSLog(@"网站个数：%zd", [factory webSiteCount]);
    
    for (NSInteger index = 0; index < 1000; index ++) {
        ZZFlyweightWebSite *webSiteX =  [factory webSiteWithKey:[NSString stringWithFormat:@"网站%zd", index+1]];
        [webSiteX loadUser:[ZZFlyweightUser userWithName:[NSString stringWithFormat:@"赵丽颖%zd", index+1]]];
    }
    NSLog(@"疯狂创建网站个数：%zd", [factory webSiteCount]);
    
//    [factory removeAllWebSite];
//    NSLog(@"删除全部网站个数：%zd", [factory webSiteCount]);
}

+ (void)showSameString
{
    NSString *stringA = @"ZZDesignPatterns";
    NSString *stringB = @"ZZDesignPatterns";
    
    NSLog(@"%p, %p", stringA, stringB);
}

@end
