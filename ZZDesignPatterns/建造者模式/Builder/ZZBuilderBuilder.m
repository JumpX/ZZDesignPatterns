//
//  ZZBuilderBuilder.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZBuilderBuilder.h"

@implementation ZZBuilderBuilder

- (instancetype)init
{
    if (self = [super init]) {
        self.product = [ZZBuilderProduct new];
    }
    return self;
}

- (void)buildPartSystem
{
    
}

- (void)buildPartSoftware
{
    
}

- (void)buildPartBrand
{
    
}

@end
