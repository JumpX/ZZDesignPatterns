//
//  ZZVisitorWoman.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZVisitorWoman.h"
#import "ZZVisitorAction.h"

@implementation ZZVisitorWoman

- (void)acceptVisitor:(ZZVisitorAction *)visitor
{
    [visitor actionWithWoman:self];
}

@end
