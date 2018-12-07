//
//  ZZSingletonA.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZSingletonA.h"

@implementation ZZSingletonA

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"ZZSingletonA";
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static ZZSingletonA *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[super allocWithZone:NULL] init];
        }
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [ZZSingletonA sharedInstance];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [ZZSingletonA sharedInstance];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [ZZSingletonA sharedInstance];
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> %@", [self class], self, self.name];
}

@end
