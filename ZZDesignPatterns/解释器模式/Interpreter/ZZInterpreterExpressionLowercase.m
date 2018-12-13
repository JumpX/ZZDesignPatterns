//
//  ZZInterpreterExpressionLowercase.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZInterpreterExpressionLowercase.h"

@implementation ZZInterpreterExpressionLowercase

- (void)excute:(NSString *)letter
{
    const char c = *letter.UTF8String;
    switch (c) {
        case 'a':
            NSLog(@"a");
            break;
        case 'b':
            NSLog(@"b");
            break;
            
        default:
            NSLog(@"~");
            break;
    }
}

@end
