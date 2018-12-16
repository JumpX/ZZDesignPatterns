//
//  ZZBuilderPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZBuilderPattern.h"
#import "ZZBuilderDirector.h"
#import "ZZBuilderMacBuilder.h"
#import "ZZBuilderWindowsBuilder.h"

@implementation ZZBuilderPattern

+ (void)show
{
    ZZBuilderDirector *director = [ZZBuilderDirector new];

    ZZBuilderBuilder *buildMac = [ZZBuilderMacBuilder new];
    [director makeProductWithBuilder:buildMac];
    [buildMac.product show];
    
    NSLog(@">>>> compare");
    
    ZZBuilderBuilder *buildWin = [ZZBuilderWindowsBuilder new];
    [director makeProductWithBuilder:buildWin];
    [buildWin.product show];
}

@end
