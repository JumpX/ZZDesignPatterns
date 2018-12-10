//
//  ZZStateNoon.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZStateNoon.h"
#import "ZZStateAfternoon.h"

@implementation ZZStateNoon

- (void)dosomeWork:(ZZStateWork *)work
{
    if (work.hour < 13) {
        NSLog(@"Noon >>> %zd hour", work.hour);
    } else {
        work.status = [ZZStateAfternoon new];
        [work dosomeWork];
    }
}

@end
