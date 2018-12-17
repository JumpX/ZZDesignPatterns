//
//  ZZCashChargeDiscount.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZCashChargeDiscount.h"

@implementation ZZCashChargeDiscount

- (NSInteger)acceptCash:(NSInteger)num
{
    return num*0.8;
}

@end
