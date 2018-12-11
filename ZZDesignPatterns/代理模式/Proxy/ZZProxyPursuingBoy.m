//
//  ZZProxyPursuingBoy.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZProxyPursuingBoy.h"
#import "ZZProxyLovelyGirl.h"

@interface ZZProxyPursuingBoy ()

@property (nonatomic, strong) ZZProxyLovelyGirl *girl;

@end

@implementation ZZProxyPursuingBoy

- (void)boyPursuingGirl:(ZZProxyLovelyGirl *)girl
{
    self.girl = girl;
}

- (void)giveGirlFlower
{
    NSLog(@"give %@ Flower", self.girl.name);
}

- (void)askGirlToCinema
{
    NSLog(@"ask %@ To Cinema", self.girl.name);
}

- (void)inviteGirlToDinner
{
    NSLog(@"invite %@ To Dinner", self.girl.name);
}

@end
