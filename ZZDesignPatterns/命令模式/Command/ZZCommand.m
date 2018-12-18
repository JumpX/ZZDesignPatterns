//
//  ZZCommand.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZCommand.h"

@implementation ZZCommand

+ (instancetype)commandWithReceiver:(ZZCommandReceiver *)receiver
{
    ZZCommand *command = [[[self class] alloc] init];
    command.receiver = receiver;
    return command;
}

- (void)execute
{
    [self.receiver dosomething:@"命令"];
}

@end
