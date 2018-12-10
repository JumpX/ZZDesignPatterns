//
//  ZZStateMorning.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZStateMorning.h"
#import "ZZStateNoon.h"

@implementation ZZStateMorning

- (void)dosomeWork:(ZZStateWork *)work
{
    if (work.hour < 12) {
        NSLog(@"Morning >>> %zd hour", work.hour);
    } else {
        work.status = [ZZStateNoon new];
        [work dosomeWork];
    }
}

@end
