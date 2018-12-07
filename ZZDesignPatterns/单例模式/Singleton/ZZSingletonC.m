//
//  ZZSingletonC.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZSingletonC.h"

@implementation ZZSingletonC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"ZZSingletonC";
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static ZZSingletonC *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> %@", [self class], self, self.name];
}

@end
