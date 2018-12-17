//
//  ZZAddFactory.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZAddFactory.h"

@implementation ZZAddFactory

- (ZZOperation *)createOperation
{
    return [ZZOperationAdd new];
}

@end
