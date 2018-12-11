//
//  ZZTemplateMethodAnswer.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZTemplateMethodAnswer.h"

@implementation ZZTemplateMethodAnswer

- (void)nameAnswer
{
    NSLog(@"My name is %@.", [self name]);
}

- (void)ageAnswer
{
    NSLog(@"I am %@ years old.", [self age]);
}

- (void)statusAnswer
{
    NSLog(@"I am %@.", [self status]);
}

@end
