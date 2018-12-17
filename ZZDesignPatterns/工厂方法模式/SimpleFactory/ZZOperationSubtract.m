//
//  ZZOperationSubtract.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZOperationSubtract.h"

@implementation ZZOperationSubtract

- (NSInteger)operationResult
{
    NSInteger result = self.numberA-self.numberB;
    NSLog(@"subtract >>>> %zd - %zd = %zd", self.numberA, self.numberB, result);
    return result;
}

@end
