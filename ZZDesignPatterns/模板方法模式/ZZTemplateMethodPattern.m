//
//  ZZTemplateMethodPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZTemplateMethodPattern.h"
#import "ZZTemplateMethodQuestion.h"
#import "ZZTemplateMethodAnswerA.h"
#import "ZZTemplateMethodAnswerB.h"

@implementation ZZTemplateMethodPattern

+ (void)show
{
    NSLog(@">>>> question:");

    ZZTemplateMethodQuestion *question = [ZZTemplateMethodQuestion new];
    [question whatIsYourName];
    [question howOldAreYou];
    [question howAreYou];
    
    NSLog(@"\n>>>> answerA");
    
    ZZTemplateMethodAnswerA *answerA = [ZZTemplateMethodAnswerA new];
    [answerA nameAnswer];
    [answerA ageAnswer];
    [answerA statusAnswer];
    
    NSLog(@"\n>>>> answerB");

    ZZTemplateMethodAnswerB *answerB = [ZZTemplateMethodAnswerB new];
    [answerB nameAnswer];
    [answerB ageAnswer];
    [answerB statusAnswer];
}

@end
