//
//  ZZFlyweightWebSite.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZFlyweightWebSite.h"

@interface ZZFlyweightWebSite ()

@property (nonatomic, copy) NSString *name;

@end

@implementation ZZFlyweightWebSite

+ (instancetype)webSiteWithName:(NSString *)name
{
    ZZFlyweightWebSite *webSite = [[[self class] alloc] init];
    webSite.name = name;
    return webSite;
}

- (void)loadUser:(ZZFlyweightUser *)user
{
    NSLog(@"网站分类：%@ 用户：%@", self.name, [user userName]);
}

@end
