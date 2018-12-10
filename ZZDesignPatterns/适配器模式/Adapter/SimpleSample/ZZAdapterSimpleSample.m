//
//  ZZAdapterSimpleSample.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZAdapterSimpleSample.h"

@implementation ZZAdapterSimpleSample

- (void)sampleRequest
{
    NSLog(@"sampleRequest");
}

@end

@implementation ZZAdapterSimpleTarget

- (void)request
{
    NSLog(@"Target request");
}

@end

@implementation ZZAdapterSimpleAdapter

- (void)request
{
    ZZAdapterSimpleSample *sample = [ZZAdapterSimpleSample new];
    [sample sampleRequest];
}

@end

