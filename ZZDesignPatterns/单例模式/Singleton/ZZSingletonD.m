//
//  ZZSingletonD.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZSingletonD.h"

@implementation ZZSingletonD

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"ZZSingletonD";
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static ZZSingletonD *instance;
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
