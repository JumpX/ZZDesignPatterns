//
//  ZZAdapterPlayerAdapter.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZAdapterPlayerAdapter.h"

@interface ZZAdapterPlayerAdapter ()

@property (nonatomic, strong) ZZAdapterPlayerCBA *cbaPlayer;

@end

@implementation ZZAdapterPlayerAdapter

- (instancetype)init
{
    if (self = [super init]) {
        self.cbaPlayer = [ZZAdapterPlayerCBA new];
    }
    return self;
}

- (void)attack
{
    [self.cbaPlayer 进攻];
}

- (void)defense
{
    [self.cbaPlayer 防守];
}

@end
