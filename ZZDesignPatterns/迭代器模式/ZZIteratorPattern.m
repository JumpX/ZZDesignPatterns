//
//  ZZIteratorPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZIteratorPattern.h"
#import "ZZIterator.h"

@implementation ZZIteratorPattern

+ (void)show
{
    [ZZIteratorPattern showIteratorBlock];
    
//    [ZZIteratorPattern showIterator];
//    [ZZIteratorPattern showBarrierAsync];
//    [ZZIteratorPattern showArrayThreadSafe];
}

// iterator
+ (void)showIterator
{
    ZZMutableArray *list = [ZZMutableArray array];
    [list addObject:@"name"];
    [list addObject:@"school"];
    [list removeAllObjects];
    [list addObject:@"age"];
    [list addObject:@"sex"];
    [list addObject:@"weight"];
    [list removeObjectAtIndex:1];
    [list replaceObjectAtIndex:0 withObject:@"zzAge"];
    [list removeLastObject];
    NSLog(@"%zd", [list indexOfObject:@"zzAge"]);
    
    ZZIterator *iterator = [ZZIterator iteratorWithArray:list];
    id firstItem = iterator.firstObject;
    NSLog(@"firstObject:%@", firstItem);
    while (!iterator.isDone) {
        NSLog(@"currentObject:%@", iterator.currentObject);
        [iterator nextObject];
    }
}

// iterator block
+ (void)showIteratorBlock
{
    NSArray *array = @[@"show", @"Iterator", @"Objects", @"UsingBlock", @"Method", @"show", @"Iterator", @"Objects", @"UsingBlock", @"Method", @"show", @"Iterator", @"Objects", @"UsingBlock", @"Method", @"show", @"Iterator", @"Objects", @"UsingBlock", @"Method"];
    
    ZZMutableArray *list = [ZZMutableArray new];
    [list addObjectsFromArray:array];
    ZZIterator *iterator = [ZZIterator iteratorWithArray:list];
    [iterator iteratorObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 13) *stop = YES;
        NSLog(@"list:%@ %zd %d", obj, idx, *stop);
    }];

//    NSLog(@"compare >>>>");
    
//    [iterator iteratorObjectsWithOptions:ZZIteratorOptionsReverse UsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (idx == 13) *stop = YES;
//        NSLog(@"list:%@ %zd %d", obj, idx, *stop);
//    }];

//    NSLog(@"compare >>>>");
//
//    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (idx == 3) *stop = YES;
//        NSLog(@"array:%@ %zd %d", obj, idx, *stop);
//    }];
//
//    NSLog(@"compare >>>>");
//
//    [array enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (idx == 13) *stop = YES;
//        NSLog(@"array:%@ %zd %d", obj, idx, *stop);
//    }];
}

// ZZMutableArray线程安全
+ (void)showArrayThreadSafe
{
    ZZMutableArray *list = [ZZMutableArray array];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for ( int i = 0; i < 10; i ++) {

        dispatch_sync(queue, ^{
            NSLog(@"添加第%d个",i);
            [list addObject:[NSString stringWithFormat:@"%d",i]];
        });
        dispatch_async(queue, ^{
            NSLog(@"删除第%d个",i);
            [list removeObjectAtIndex:0];
        });
    }
}

// dispatch_barrier_async
+ (void)showBarrierAsync
{
    dispatch_queue_t queue = dispatch_queue_create("thread", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        sleep(3);
        NSLog(@"test1");
    });
    dispatch_async(queue, ^{
        NSLog(@"test2");
    });
    dispatch_sync(queue, ^{
        NSLog(@"test3");
    });
    dispatch_barrier_sync(queue, ^{ // 分界线在这里 请注意是同步的
        sleep(1);
        for (int i = 0; i<50; i++) {
            if (i == 10 ) {
                NSLog(@"point1");
            }else if(i == 20){
                NSLog(@"point2");
            }else if(i == 40){
                NSLog(@"point3");
            }
        }
    });
    NSLog(@"hello");
    dispatch_async(queue, ^{
        NSLog(@"test4");
    });
    NSLog(@"world");
    dispatch_async(queue, ^{
        NSLog(@"test5");
    });
    dispatch_async(queue, ^{
        NSLog(@"test6");
    });
}

@end
