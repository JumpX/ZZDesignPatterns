//
//  ZZInterpreterPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZInterpreterPattern.h"
#import "ZZInterpreterContext.h"
#import "ZZInterpreterExpressionCapital.h"
#import "ZZInterpreterExpressionLowercase.h"

@implementation ZZInterpreterPattern

+ (void)showZZInterpreterPattern
{
    ZZInterpreterContext *context = [ZZInterpreterContext new];
    context.text = @"AaCHLhjs;dkLJHNJLLabAmnpihedvVHABba";
    ZZInterpreterExpression *expression = [ZZInterpreterExpression new];
    while (context.text.length > 0) {
        NSString *letter = [context.text substringToIndex:1];
        unichar asciiCode = [letter characterAtIndex:0];
    
        if (asciiCode > 64 && asciiCode < 91) {
            expression = [ZZInterpreterExpressionCapital new];
        } else if (asciiCode > 96 && asciiCode < 123) {
            expression = [ZZInterpreterExpressionLowercase new];
        }
        
        [expression interpreter:context];
    }
}

@end
