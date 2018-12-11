//
//  ZZProxyPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZProxyPattern.h"
#import "ZZProxyLovelyGirl.h"
#import "ZZProxyPursuingBoy.h"
#import "ZZProxyPursuingProxy.h"

@implementation ZZProxyPattern

+ (void)showZZProxyPattern
{
    ZZProxyLovelyGirl *girl = [ZZProxyLovelyGirl new];
    girl.name = @"赵丽颖";
    
    ZZProxyPursuingProxy *proxy = [ZZProxyPursuingProxy new];
    [proxy proxyPursuingGirl:girl];
    [proxy giveGirlFlower];
    [proxy askGirlToCinema];
    [proxy inviteGirlToDinner];
}

@end
