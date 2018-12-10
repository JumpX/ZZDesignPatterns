//
//  ZZStateSleeping.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZStateSleeping.h"

@implementation ZZStateSleeping

- (void)dosomeWork:(ZZStateWork *)work
{
    NSLog(@"MustSleep >>> %zd hour", work.hour);
}

@end
