//
//  ZZStatePattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZStatePattern.h"
#import "ZZStateWork.h"

@implementation ZZStatePattern

+ (void)show
{
    ZZStateWork *work = [ZZStateWork new];
    [work dosomeWork]; // 默认9点
    
    for (NSUInteger hour = 0; hour <= 24; hour ++) {
        work.hour = hour;
        [work dosomeWork];
    }
}

@end
