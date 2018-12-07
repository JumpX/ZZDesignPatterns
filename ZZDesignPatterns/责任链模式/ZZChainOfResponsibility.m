//
//  ZZChainOfResponsibility.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZChainOfResponsibility.h"

@implementation ZZChainOfResponsibility

+ (void)showZZChainOfResponsibility
{
    ZZMangerLow *low = [ZZMangerLow new];
    ZZMangerMid *mid = [ZZMangerMid new];
    ZZMangerHigh *high = [ZZMangerHigh new];
    low.superior = mid;
    mid.superior = high;
    
    ZZRequest *request = [ZZRequest new];
    request.days = 0;
    [low handleRequest:request];
    
    request.days = 2;
    [low handleRequest:request];
    
    request.days = 4;
    [low handleRequest:request];
    
    request.days = 8;
    [low handleRequest:request];

    request.days = 100;
    [low handleRequest:request];
}

@end
