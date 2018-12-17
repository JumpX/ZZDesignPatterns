//
//  ZZMultiplyFactory.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMultiplyFactory.h"
#import "ZZOperationMultiply.h"

@implementation ZZMultiplyFactory

- (ZZOperation *)createOperation
{
    return [ZZOperationMultiply new];
}

@end
