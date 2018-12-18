//
//  ZZFlyweightUser.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZFlyweightUser.h"

@interface ZZFlyweightUser ()

@property (nonatomic, copy) NSString *name;

@end

@implementation ZZFlyweightUser

+ (instancetype)userWithName:(NSString *)name
{
    ZZFlyweightUser *user = [[[self class] alloc] init];
    user.name = name;
    return user;
}

- (NSString *)userName
{
    return self.name;
}

@end
