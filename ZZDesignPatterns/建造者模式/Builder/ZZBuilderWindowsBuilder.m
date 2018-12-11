//
//  ZZBuilderWindowsBuilder.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZBuilderWindowsBuilder.h"

@implementation ZZBuilderWindowsBuilder

- (void)buildPartSystem
{
    [self.product addPart:@"windows"];
}

- (void)buildPartSoftware
{
    [self.product addPart:@".exe"];
}

- (void)buildPartBrand
{
    [self.product addPart:@"Microsoft"];
}

@end
