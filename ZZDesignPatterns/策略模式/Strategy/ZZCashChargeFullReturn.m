//
//  ZZCashChargeFullReturn.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZCashChargeFullReturn.h"

@implementation ZZCashChargeFullReturn

- (NSInteger)acceptCash:(NSInteger)num
{
    if (num >= 300) {
        return num-100;
    } else return num;
}

@end
