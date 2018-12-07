//
//  ZZMangerMid.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMangerMid.h"

@implementation ZZMangerMid

- (void)handleRequest:(ZZRequest *)request
{
    if (request.days <= 5) {
        NSLog(@"%@ >>>> days is %zd", [self class], request.days);
    } else {
        [self.superior handleRequest:request];
    }
}

@end
