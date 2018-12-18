//
//  ZZCommandInvoker.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZCommandInvoker.h"
#import "ZZCommand.h"

@interface ZZCommandInvoker ()

@property (nonatomic, strong) NSMutableArray <ZZCommand *>*commandList;

@end

@implementation ZZCommandInvoker

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.commandList = [NSMutableArray new];
    }
    return self;
}

- (void)addCommand:(ZZCommand *)command
{
    [self.commandList addObject:command];
}

- (void)removeCommand:(ZZCommand *)command
{
    [self.commandList removeObject:command];
}

- (void)executeCommand
{
    for (ZZCommand *command in self.commandList) {
        [command execute];
    }
}

@end
