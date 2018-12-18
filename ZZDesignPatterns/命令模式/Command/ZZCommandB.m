//
//  ZZCommandB.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZCommandB.h"

@implementation ZZCommandB

- (void)execute
{
    [self.receiver dosomething:@"命令B"];
}

@end
