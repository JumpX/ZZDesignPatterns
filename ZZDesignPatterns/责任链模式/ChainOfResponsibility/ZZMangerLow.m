//
//  ZZMangerLow.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMangerLow.h"

@implementation ZZMangerLow

- (void)handleRequest:(ZZRequest *)request
{
    if (request.days <= 2) {
        NSLog(@"%@ >>>> days is %zd", [self class], request.days);
    } else {
        [self.superior handleRequest:request];
    }
}

@end
