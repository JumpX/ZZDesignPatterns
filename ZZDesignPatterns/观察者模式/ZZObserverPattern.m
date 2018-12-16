//
//  ZZObserverPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZObserverPattern.h"
#import "ZZNotification.h"

static NSString *const ZZNotificationWithDefaultCenter = @"ZZNotificationWithDefaultCenter";

static NSString *const ZZNotificationWithNew1 = @"ZZNotificationWithNew1";
static NSString *const ZZNotificationWithNew2 = @"ZZNotificationWithNew2";
static NSString *const ZZNotificationWithNew3 = @"ZZNotificationWithNew3";

@implementation ZZObserverPattern

+ (void)show
{
    // 自己实现 消息中心
    [ZZObserverPattern showZZNotification];
    NSLog(@"compare >>>>");
    // 苹果封装 消息中心
    [ZZObserverPattern showNSNotification];
}

/*
 ZZNotificationCenter
 */
+ (void)showZZNotification
{
    ZZObserverPattern *observer = [[[self class] alloc] init];
    
    // defaultCenter
    [[ZZNotificationCenter defaultCenter] addObserver:observer selector:@selector(zzSelector:) name:ZZNotificationWithDefaultCenter object:nil];
    [[ZZNotificationCenter defaultCenter] postNotificationName:ZZNotificationWithDefaultCenter object:@"默认实例 >>>> defaultCenter"];

    // newCenter >>> addObserver/addObserverForName
    ZZNotificationCenter *newCenter = [ZZNotificationCenter new];
    [newCenter addObserver:observer selector:@selector(zzSelector:) name:ZZNotificationWithNew1 object:nil];
    [newCenter addObserver:observer selector:@selector(zzSelector:) name:ZZNotificationWithNew2 object:nil];
    [newCenter addObserverForName:ZZNotificationWithNew3 object:nil queue:[NSOperationQueue currentQueue] usingBlock:^(ZZNotification * _Nonnull noti) {
        NSLog(@"<%p> %@ %@", noti, noti.name, noti.object);
    }];
    
    // newCenter >>> postNotificationName
    [newCenter postNotificationName:ZZNotificationWithNew1 object:@"newCenter1"];
    [newCenter postNotificationName:ZZNotificationWithNew2 object:@"newCenter2"];
    [newCenter postNotificationName:ZZNotificationWithNew3 object:@"newCenter3"];
}

- (void)zzSelector:(ZZNotification *)noti
{
    NSLog(@"<%p> %@ %@", noti, noti.name, noti.object);
}

/*
 NSNotificationCenter
 */
+ (void)showNSNotification
{
    ZZObserverPattern *observer = [[[self class] alloc] init];
    
    // defaultCenter
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:@selector(nsSelector:) name:ZZNotificationWithDefaultCenter object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:ZZNotificationWithDefaultCenter object:@"默认实例 >>>> defaultCenter"];
    
    // newCenter >>> addObserver/addObserverForName
    NSNotificationCenter *newCenter = [NSNotificationCenter new];
    [newCenter addObserver:observer selector:@selector(nsSelector:) name:ZZNotificationWithNew1 object:nil];
    [newCenter addObserver:observer selector:@selector(nsSelector:) name:ZZNotificationWithNew2 object:nil];
    [newCenter addObserverForName:ZZNotificationWithNew3 object:nil queue:[NSOperationQueue currentQueue] usingBlock:^(NSNotification * _Nonnull noti) {
        NSLog(@"<%p> %@ %@", noti, noti.name, noti.object);
    }];
    
    // newCenter >>> postNotificationName
    [newCenter postNotificationName:ZZNotificationWithNew1 object:@"newCenter1"];
    [newCenter postNotificationName:ZZNotificationWithNew2 object:@"newCenter2"];
    [newCenter postNotificationName:ZZNotificationWithNew3 object:@"newCenter3"];
}

- (void)nsSelector:(NSNotification *)noti
{
    NSLog(@"<%p> %@ %@", noti, noti.name, noti.object);
}

@end
