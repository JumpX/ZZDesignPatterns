//
//  ZZStrategyPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZStrategyPattern.h"
#import "ZZCashContext.h"

@implementation ZZStrategyPattern

+ (void)show
{
    NSInteger price = arc4random()%1000;
    ZZCashType type = arc4random()%3;
    
    ZZCashContext *context = [ZZCashContext contextWithCashType:type];
    NSInteger result = [context cashResult:price];
    NSLog(@"总价：%zd 方式：%zd 实收：%zd", price, type+1, result);
}

@end
