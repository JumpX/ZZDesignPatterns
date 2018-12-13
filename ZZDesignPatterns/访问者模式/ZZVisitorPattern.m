//
//  ZZVisitorPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZVisitorPattern.h"
#import "ZZVisitorPerson.h"
#import "ZZVisitorActionSuccess.h"
#import "ZZVisitorActionFail.h"
#import "ZZVisitorActionLove.h"

@implementation ZZVisitorPattern

+ (void)showZZVisitorPattern
{
    ZZVisitorMan *man = [ZZVisitorMan new];
    man.name = @"黄渤";
    ZZVisitorWoman *woman = [ZZVisitorWoman new];
    woman.name = @"赵丽颖";
    ZZVisitorActionSuccess *success = [ZZVisitorActionSuccess new];
    ZZVisitorActionFail *fail = [ZZVisitorActionFail new];
    ZZVisitorActionLove *love = [ZZVisitorActionLove new];
    
    [man acceptVisitor:success];
    [man acceptVisitor:fail];
    [man acceptVisitor:love];
    [woman acceptVisitor:success];
    [woman acceptVisitor:fail];
    [woman acceptVisitor:love];
}

@end
