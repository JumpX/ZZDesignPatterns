//
//  ZZDivideFactory.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZDivideFactory.h"
#import "ZZOperationDivide.h"

@implementation ZZDivideFactory

- (ZZOperation *)createOperation
{
    return [ZZOperationDivide new];
}

@end
