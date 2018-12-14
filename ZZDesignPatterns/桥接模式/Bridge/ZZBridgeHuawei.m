//
//  ZZBridgeHuawei.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZBridgeHuawei.h"
#import "ZZBridgePhoneSoft.h"

@implementation ZZBridgeHuawei

- (void)runSoft
{
    NSLog(@"huawei >>>>");
    [self.soft runSoft];
}

@end
