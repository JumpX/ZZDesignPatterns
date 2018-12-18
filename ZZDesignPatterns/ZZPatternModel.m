//
//  ZZPatternModel.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZPatternModel.h"

@implementation ZZPatternModel

+ (instancetype)patternWithID:(NSString *)ID name:(NSString *)name enName:(NSString *)enName type:(NSString *)type desc:(NSString *)desc demo:(NSString *)demo
{
    ZZPatternModel *pattern = [[[self class] alloc] init];
    pattern.ID = ID;
    pattern.name = name;
    pattern.enName = enName;
    pattern.type = type;
    pattern.desc = desc;
    pattern.demo = demo;
    return pattern;
}

@end
