//
//  ZZStateOffwork.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZStateOffwork.h"
#import "ZZStateSleeping.h"

@implementation ZZStateOffwork

- (void)dosomeWork:(ZZStateWork *)work
{
    if (work.hour < 23) {
        NSLog(@"OffWork >>> %zd hour", work.hour);
    } else {
        work.status = [ZZStateSleeping new];
        [work dosomeWork];
    }
}

@end
