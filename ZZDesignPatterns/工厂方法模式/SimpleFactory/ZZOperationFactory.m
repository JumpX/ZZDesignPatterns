//
//  ZZOperationFactory.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZOperationFactory.h"
#import "ZZOperationAdd.h"
#import "ZZOperationSubtract.h"
#import "ZZOperationMultiply.h"
#import "ZZOperationDivide.h"
#import "ZZOperationPower.h"

@implementation ZZOperationFactory

+ (ZZOperation *)createOperation:(ZZOperationType)type
{
    switch (type) {
        case ZZOperationTypeAdd:
            return [ZZOperationAdd new];
        case ZZOperationTypeSubtract:
            return [ZZOperationSubtract new];
        case ZZOperationTypeMultiply:
            return [ZZOperationMultiply new];
        case ZZOperationTypeDivide:
            return [ZZOperationDivide new];
        case ZZOperationTypePower:
            return [ZZOperationPower new];

        default:
            break;
    }
}

@end
