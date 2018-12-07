//
//  ZZSingletonB.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZSingletonB.h"

@implementation ZZSingletonB

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"ZZSingletonB";
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static ZZSingletonB *instance;
    if (instance == nil) {
        @synchronized(self) {
            if (instance == nil) {
                instance = [[super allocWithZone:NULL] init];
            }
        }
    }
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [ZZSingletonB sharedInstance];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [ZZSingletonB sharedInstance];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [ZZSingletonB sharedInstance];
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> %@", [self class], self, self.name];
}

@end
