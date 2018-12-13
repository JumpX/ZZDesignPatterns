//
//  ZZInterpreterExpressionCapital.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZInterpreterExpressionCapital.h"

@implementation ZZInterpreterExpressionCapital

- (void)excute:(NSString *)letter
{
    const char c = *letter.UTF8String;
    switch (c) {
        case 'A':
            NSLog(@"氢");
            break;
        case 'B':
            NSLog(@"氦");
            break;
        case 'C':
            NSLog(@"锂");
            break;
        case 'D':
            NSLog(@"铍");
            break;
        case 'E':
            NSLog(@"硼");
            break;
        case 'F':
            NSLog(@"碳");
            break;
        case 'G':
            NSLog(@"氮");
            break;
        case 'H':
            NSLog(@"氧");
            break;
        case 'I':
            NSLog(@"氟");
            break;
        case 'J':
            NSLog(@"氖");
            break;
        case 'K':
            NSLog(@"钠");
            break;
        case 'L':
            NSLog(@"镁");
            break;
        case 'M':
            NSLog(@"铝");
            break;
        case 'N':
            NSLog(@"硅");
            break;
        case 'O':
            NSLog(@"磷");
            break;
        case 'P':
            NSLog(@"硫");
            break;
        case 'Q':
            NSLog(@"氯");
            break;
        case 'R':
            NSLog(@"氩");
            break;
        case 'S':
            NSLog(@"钾");
            break;
        case 'T':
            NSLog(@"钙");
            break;
        case 'U':
            NSLog(@"钪");
            break;
        case 'V':
            NSLog(@"钛");
            break;
        case 'W':
            NSLog(@"钒");
            break;
        case 'X':
            NSLog(@"铬");
            break;
        case 'Y':
            NSLog(@"锰");
            break;
        case 'Z':
            NSLog(@"铁");
            break;
            
        default:
            break;
    }
}

@end
