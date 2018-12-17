//
//  ZZOperationAdd.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZOperationAdd.h"

@implementation ZZOperationAdd

- (NSInteger)operationResult
{
    NSInteger result = self.numberA+self.numberB;
    NSLog(@"add >>>> %zd + %zd = %zd", self.numberA, self.numberB, result);
    return result;
}

@end
