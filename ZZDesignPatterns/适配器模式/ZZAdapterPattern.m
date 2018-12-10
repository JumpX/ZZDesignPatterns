//
//  ZZAdapterPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZAdapterPattern.h"
#import "ZZAdapterSimpleSample.h"
#import "ZZAdapterPlayerAdapter.h"
#import "ZZAdapterPlayerNBA.h"

@implementation ZZAdapterPattern

+ (void)showZZAdapterPattern
{
    [self showSimpleSample];
    [self showPlayers];
}

+ (void)showSimpleSample
{
    ZZAdapterSimpleTarget *target = [ZZAdapterSimpleAdapter new];
    [target request];
}

+ (void)showPlayers
{
    ZZAdapterPlayer *kobe = [ZZAdapterPlayerNBA new];
    kobe.name = @"科比";
    [kobe attack];
    [kobe attack];
    
    ZZAdapterPlayer *ben = [ZZAdapterPlayerNBA new];
    ben.name = @"大本";
    [ben defense];
    [ben defense];
    
    ZZAdapterPlayer *wangzhelin = [ZZAdapterPlayerAdapter new];
    wangzhelin.name = @"王哲林";
    [wangzhelin attack];
    [wangzhelin defense];
}

@end
