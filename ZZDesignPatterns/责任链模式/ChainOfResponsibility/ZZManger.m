//
//  ZZManger.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZManger.h"

@implementation ZZManger

- (void)handleRequest:(ZZRequest *)request
{
    if (request.days > 0) {
        [self.superior handleRequest:request];
    } else {
        NSLog(@"%@ >>>> days is 0", [self class]);
    }
}

@end
