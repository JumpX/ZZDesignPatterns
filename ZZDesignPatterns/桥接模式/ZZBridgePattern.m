//
//  ZZBridgePattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZBridgePattern.h"
#import "ZZBridgeIPhone.h"
#import "ZZBridgeHuawei.h"
#import "ZZBridgeSoftEmail.h"
#import "ZZBridgeSoftTetris.h"

@implementation ZZBridgePattern

+ (void)showZZBridgePattern
{
    ZZBridgeSoftTetris *tetris = [ZZBridgeSoftTetris new];
    ZZBridgeSoftEmail *email = [ZZBridgeSoftEmail new];
    
    ZZBridgeIPhone *iPhone = [ZZBridgeIPhone new];
    iPhone.soft = tetris;
    [iPhone runSoft];
    iPhone.soft = email;
    [iPhone runSoft];
    
    ZZBridgeHuawei *huawei = [ZZBridgeHuawei new];
    huawei.soft = tetris;
    [huawei runSoft];
    huawei.soft = email;
    [huawei runSoft];
}

@end
