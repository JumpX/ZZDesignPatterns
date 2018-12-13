//
//  ZZMediatorChina.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMediatorChina.h"
#import "ZZMediatorUNSecurityCouncil.h"

@implementation ZZMediatorChina

- (void)say:(NSString *)message
{
    [self.mediator say:message country:self];
}

- (void)getMessage:(NSString *)message
{
    NSLog(@"China 得到消息:%@",message);
}

@end
