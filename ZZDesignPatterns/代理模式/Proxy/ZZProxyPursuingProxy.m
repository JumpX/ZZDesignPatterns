//
//  ZZProxyPursuingProxy.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZProxyPursuingProxy.h"
#import "ZZProxyPursuingBoy.h"
#import "ZZProxyLovelyGirl.h"

@interface ZZProxyPursuingProxy ()

@property (nonatomic, strong) ZZProxyPursuingBoy *boy;

@end

@implementation ZZProxyPursuingProxy

- (instancetype)init
{
    if (self = [super init]) {
        self.boy = [ZZProxyPursuingBoy new];
    }
    return self;
}

- (void)proxyPursuingGirl:(ZZProxyLovelyGirl *)girl
{
    [self.boy boyPursuingGirl:girl];
}

- (void)giveGirlFlower
{
    [self.boy giveGirlFlower];
}

- (void)askGirlToCinema
{
    [self.boy askGirlToCinema];
}

- (void)inviteGirlToDinner
{
    [self.boy inviteGirlToDinner];
}

@end
