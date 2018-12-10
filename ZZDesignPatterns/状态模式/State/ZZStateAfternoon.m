//
//  ZZStateAfternoon.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZStateAfternoon.h"
#import "ZZStateEvening.h"

@implementation ZZStateAfternoon

- (void)dosomeWork:(ZZStateWork *)work
{
    if (work.hour < 19) {
        NSLog(@"Afternoon >>> %zd hour", work.hour);
    } else {
        work.status = [ZZStateEvening new];
        [work dosomeWork];
    }
}

@end
