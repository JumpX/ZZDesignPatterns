//
//  ZZTemplateMethodQuestion.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZTemplateMethodQuestion.h"

@implementation ZZTemplateMethodQuestion

- (void)whatIsYourName
{
    NSLog(@"What is your name? A:Lily B:Lucy");
}

- (void)howOldAreYou
{
    NSLog(@"I am __ years old. A:18 B:28");
}

- (void)howAreYou
{
    NSLog(@"I am __. A:fine B:not good");
}

@end
