//
//  ZZIterator.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZIterator.h"

@interface ZZIterator ()

@property (nonatomic, strong) ZZMutableArray    *zzArray;
@property (nonatomic, assign) NSInteger         zzCount;
@property (nonatomic, assign) NSInteger         zzIndex;
@property (nonatomic, assign) ZZIteratorOptions options;
@property (nonatomic, assign) BOOL              stop;

@end

@implementation ZZIterator

+ (instancetype)iteratorWithArray:(ZZMutableArray *)zzArray
{
    ZZIterator *iterator = [ZZIterator new];
    iterator.zzArray = zzArray;
    iterator.zzCount = zzArray.count;
    iterator.zzIndex = 0;
    iterator.options = ZZIteratorOptionsConcurrent;
    return iterator;
}

- (void)resetArgs
{
    switch (self.options) {
        case ZZIteratorOptionsConcurrent:
            _zzIndex = -1;
            break;
        case ZZIteratorOptionsReverse:
            _zzIndex = _zzCount;
            break;
            
        default:
            break;
    }
    _stop = NO;
}

- (id)firstObject
{
    return [self.zzArray firstObject];
}

- (id)nextObject
{
    switch (self.options) {
        case ZZIteratorOptionsConcurrent:
            _zzIndex ++;
            break;
        case ZZIteratorOptionsReverse:
            _zzIndex --;
            break;
            
        default:
            break;
    }
    return [self currentObject];
}

- (id)currentObject
{
    return [self.zzArray objectAtIndex:_zzIndex];
}

- (BOOL)isDone
{
    if (_stop) return YES;
    
    BOOL isDone = NO;
    switch (self.options) {
        case ZZIteratorOptionsConcurrent:
            if (_zzIndex >= _zzCount) isDone = YES;
            break;
        case ZZIteratorOptionsReverse:
            if (_zzIndex < 0) isDone = YES;
            break;
            
        default:
            break;
    }

    return isDone;
}

- (void)iteratorObjectsUsingBlock:(void(^)(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop))block
{
    [self iteratorObjectsWithOptions:ZZIteratorOptionsConcurrent UsingBlock:block];
}

- (void)iteratorObjectsWithOptions:(ZZIteratorOptions)opts UsingBlock:(void(^)(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop))block
{
    id object;
    self.options = opts;
    [self resetArgs];
    while (self.isDone == NO && (object = [self nextObject]) != nil) {
        @autoreleasepool {
            dispatch_barrier_sync([ZZIteratorQueue iteratorSyncQueue], ^{
                BOOL stop = NO;
                if (block) {
                    block(object, self.zzIndex, &stop);
                }
                if (stop) self.stop = YES;
            });
        }
    }
}

@end
