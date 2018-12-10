//
//  ZZIteratorQueue.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZIteratorQueue.h"

@implementation ZZIteratorQueue

+ (dispatch_queue_t)iteratorSyncQueue
{
    static dispatch_queue_t queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("com.JumpX.ZZDesignPatterns.ZZIterator.syncQueue", DISPATCH_QUEUE_CONCURRENT);
    });
    return queue;
}

@end
