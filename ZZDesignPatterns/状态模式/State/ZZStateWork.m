//
//  ZZStateWork.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZStateWork.h"
#import "ZZStateMorning.h"

@implementation ZZStateWork

- (instancetype)init
{
    if (self = [super init]) {
        _hour = 9;
        _status = [ZZStateMorning new];
    }
    return self;
}

- (void)dosomeWork
{
    [self.status dosomeWork:self];
}

@end
