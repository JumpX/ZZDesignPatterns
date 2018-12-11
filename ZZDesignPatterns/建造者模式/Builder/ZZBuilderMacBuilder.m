//
//  ZZBuilderMacBuilder.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZBuilderMacBuilder.h"

@implementation ZZBuilderMacBuilder

- (void)buildPartSystem
{
    [self.product addPart:@"macOS"];
}

- (void)buildPartSoftware
{
    [self.product addPart:@".app"];
}

- (void)buildPartBrand
{
    [self.product addPart:@"Macintosh"];
}

@end
