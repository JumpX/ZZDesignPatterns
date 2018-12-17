//
//  ZZPowerFactory.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZPowerFactory.h"
#import "ZZOperationPower.h"

@implementation ZZPowerFactory

- (ZZOperation *)createOperation
{
    return [ZZOperationPower new];
}

@end
