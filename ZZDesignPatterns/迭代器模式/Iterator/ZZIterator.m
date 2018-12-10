//
//  ZZIterator.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZIterator.h"

@interface ZZIterator ()

@property (nonatomic, strong) ZZMutableArray *zzArray;
@property (nonatomic, assign) NSUInteger     zzCount;
@property (nonatomic, assign) NSUInteger     zzIndex;

@end

@implementation ZZIterator

+ (instancetype)iteratorWithArray:(ZZMutableArray *)zzArray
{
    ZZIterator *iterator = [ZZIterator new];
    iterator.zzArray = zzArray;
    iterator.zzCount = zzArray.count;
    iterator.zzIndex = 0;
    return iterator;
}

- (id)firstObject
{
    return [self.zzArray objectAtIndex:0];
}

- (id)nextObject
{
    self.zzIndex ++;
    return self.currentObject;
}

- (id)currentObject
{
    return [self.zzArray objectAtIndex:self.zzIndex];
}

- (BOOL)isDone
{
    if (self.zzIndex >= self.zzCount) {
        return YES;
    } else return NO;
}

- (void)iteratorObjectsUsingBlock:(void(^)(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop))block
{
    while (!self.isDone) {
        BOOL stop = NO;
        if (block) {
            block(self.currentObject, self.zzIndex, &stop);
        }
        if (stop) return;
        [self nextObject];
    }
}

@end
