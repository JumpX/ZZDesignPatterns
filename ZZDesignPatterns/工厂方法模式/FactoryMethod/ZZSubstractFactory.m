//
//  ZZSubstractFactory.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZSubstractFactory.h"
#import "ZZOperationSubtract.h"

@implementation ZZSubstractFactory

- (ZZOperation *)createOperation
{
    return [ZZOperationSubtract new];
}

@end
