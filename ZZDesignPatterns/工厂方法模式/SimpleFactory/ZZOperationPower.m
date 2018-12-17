//
//  ZZOperationPower.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZOperationPower.h"

@implementation ZZOperationPower

- (NSInteger)operationResult
{
    NSInteger result = powl(self.numberA, self.numberB);
    NSLog(@"power >>>> (%zd)%zd = %zd", self.numberA, self.numberB, result);
    return result;
}

@end
