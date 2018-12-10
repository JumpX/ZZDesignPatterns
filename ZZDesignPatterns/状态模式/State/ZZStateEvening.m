//
//  ZZStateEvening.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZStateEvening.h"
#import "ZZStateOffwork.h"
#import "ZZStateSleeping.h"

@implementation ZZStateEvening

- (void)dosomeWork:(ZZStateWork *)work
{
    if (work.isFinished) {
        work.status = [ZZStateOffwork new];
        [work dosomeWork];
    } else {
        if (work.hour < 21) {
            NSLog(@"AddWork >>> %zd hour", work.hour);
        } else {
            work.status = [ZZStateOffwork new];
            [work dosomeWork];
        }
    }
}

@end
