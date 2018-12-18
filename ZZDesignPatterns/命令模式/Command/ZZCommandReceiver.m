//
//  ZZCommandReceiver.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZCommandReceiver.h"

@implementation ZZCommandReceiver

+ (instancetype)receiverWithName:(NSString *)name
{
    ZZCommandReceiver *receiver = [[[self class] alloc] init];
    receiver.name = name;
    return receiver;
}

- (void)dosomething:(NSString *)action
{
    NSLog(@"%@ 执行 %@", self.name, action);
}

@end
