//
//  ZZInterpreterExpression.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZInterpreterExpression.h"

@implementation ZZInterpreterExpression

- (void)interpreter:(ZZInterpreterContext *)context
{
    if (context.text.length == 0) return;
    
    NSString *letter = [context.text substringToIndex:1];
    NSString *text = [context.text substringFromIndex:1];
    context.text = text;
    [self excute:letter];
}

- (void)excute:(NSString *)letter
{
    
}

@end
