//
//  ZZMangerHigh.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMangerHigh.h"

@implementation ZZMangerHigh

- (void)handleRequest:(ZZRequest *)request
{
    if (request.days <= 10) {
        NSLog(@"%@ >>>> days is %zd", [self class], request.days);
    } else {
        NSLog(@"%@ >>>> refuse! your days is %zd!", [self class], request.days);
    }
}

@end
