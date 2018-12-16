//
//  ZZPrototypePattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZPrototypePattern.h"
#import "ZZPrototypeResume.h"

@implementation ZZPrototypePattern

+ (void)show
{
    ZZPrototypeResume *A = [ZZPrototypeResume new];
    [A setResumeName:@"A"];
    [A setResumeInfoWithAge:@"18" sex:@"boy"];
    [A setResumeWorkWithCompany:@"菜市场" date:@"2010-2014"];
    NSLog(@"A:\n%@", [A debugDescription]);
    
    ZZPrototypeResume *B = [A copy];
    [B setResumeName:@"B"];
    NSLog(@"B:\n%@", [B debugDescription]);
    
    ZZPrototypeResume *C = [B copy];
    [C setResumeWorkWithCompany:@"搬砖厂" date:@"2015-2018"];
    NSLog(@"C:\n%@", [C debugDescription]);
}

@end
