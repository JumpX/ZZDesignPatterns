//
//  ZZBridgeIPhone.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZBridgeIPhone.h"
#import "ZZBridgePhoneSoft.h"

@implementation ZZBridgeIPhone

- (void)runSoft
{
    NSLog(@"iPhone >>>>");
    [self.soft runSoft];
}

@end
