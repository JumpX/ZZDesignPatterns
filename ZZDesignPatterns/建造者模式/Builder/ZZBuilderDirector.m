//
//  ZZBuilderDirector.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZBuilderDirector.h"

@implementation ZZBuilderDirector

- (void)makeProductWithBuilder:(ZZBuilderBuilder *)builder
{
    [builder buildPartSystem];
    [builder buildPartSoftware];
    [builder buildPartBrand];
}

@end
