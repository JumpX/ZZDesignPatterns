//
//  ZZSingletonPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZSingletonPattern.h"

@implementation ZZSingletonPattern

+ (void)showZZSingletonPattern
{
    [ZZSingletonPattern showA];
    [ZZSingletonPattern showB];
    [ZZSingletonPattern showC];
    [ZZSingletonPattern showD];
    [ZZSingletonPattern showE];
}

+ (void)showE
{
    ZZSingletonE1 *E = [ZZSingletonE1 sharedInstance];
    NSLog(@"%@", E.debugDescription);
}

+ (void)showD
{
    ZZSingletonD *D = [ZZSingletonD sharedInstance];
    NSLog(@"%@", D.debugDescription);
}

+ (void)showC
{
    ZZSingletonC *C = [ZZSingletonC sharedInstance];
    NSLog(@"%@", C.debugDescription);
}

+ (void)showB
{
    [NSThread sleepForTimeInterval:1];
    for (NSInteger i = 0; i < 5; i ++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            ZZSingletonB *B = [ZZSingletonB sharedInstance];
            NSLog(@"%@", B.debugDescription);
        });
    }
    //    ZZSingletonB *B = [ZZSingletonB new];
    //    NSLog(@"%@", B.debugDescription);
    //    B = [ZZSingletonB sharedInstance].copy;
    //    NSLog(@"%@", B.debugDescription);
}

+ (void)showA
{
    ZZSingletonA *A = [ZZSingletonA new];
    NSLog(@"%@", A.debugDescription);
    A = A.mutableCopy;
    NSLog(@"%@", A.debugDescription);
    A = A.copy;
    NSLog(@"%@", A.debugDescription);
    A = [ZZSingletonA new];
    NSLog(@"%@", A.debugDescription);
    A = [[ZZSingletonA alloc] init];
    NSLog(@"%@", A.debugDescription);
    A = [ZZSingletonA sharedInstance];
    NSLog(@"%@", A.debugDescription);
}

@end
