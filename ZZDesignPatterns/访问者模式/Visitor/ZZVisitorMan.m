//
//  ZZVisitorMan.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZVisitorMan.h"
#import "ZZVisitorAction.h"

@implementation ZZVisitorMan

- (void)acceptVisitor:(ZZVisitorAction *)visitor
{
    [visitor actionWithMan:self];
}

@end
