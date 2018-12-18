//
//  ZZCommandPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZCommandPattern.h"
#import "ZZCommandInvoker.h"
#import "ZZCommandReceiver.h"
#import "ZZCommandA.h"
#import "ZZCommandB.h"
#import "ZZCommandC.h"

@implementation ZZCommandPattern

+ (void)show
{
    ZZCommandReceiver *receiver = [ZZCommandReceiver receiverWithName:@"执行者"];
    ZZCommandInvoker *invoker = [ZZCommandInvoker new];

    ZZCommand *commandA = [ZZCommandA commandWithReceiver:receiver];
    ZZCommand *commandB = [ZZCommandB commandWithReceiver:receiver];
    ZZCommand *commandC = [ZZCommandC commandWithReceiver:receiver];

    [invoker addCommand:commandA];
    [invoker addCommand:commandB];
    [invoker addCommand:commandC];
    [invoker removeCommand:commandB];
    
    [invoker executeCommand];
}

@end
