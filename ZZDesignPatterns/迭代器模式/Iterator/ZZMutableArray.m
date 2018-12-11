//
//  ZZMutableArray.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMutableArray.h"

@interface ZZMutableArray ()
{
    CFMutableArrayRef _array;
}

@end

@implementation ZZMutableArray

- (instancetype)init
{
    if (self = [super init]) {
        _array = CFArrayCreateMutable(kCFAllocatorDefault, 10, &kCFTypeArrayCallBacks);
    }
    return self;
}

- (instancetype)initWithCapacity:(NSUInteger)numItems
{
    if (self = [super init]) {
        _array = CFArrayCreateMutable(kCFAllocatorDefault, numItems, &kCFTypeArrayCallBacks);
    }
    return self;
}

+ (instancetype)array
{
    return [[ZZMutableArray alloc] initWithCapacity:10];
}

- (void)addObject:(id)anObject
{
    dispatch_barrier_async([ZZIteratorQueue iteratorSyncQueue], ^{
        if (anObject) {
            CFArrayAppendValue(self->_array, (__bridge const void *)(anObject));
        }
    });
}

- (void)addObjectsFromArray:(NSArray *)otherArray
{
    [otherArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addObject:obj];
    }];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    dispatch_barrier_async([ZZIteratorQueue iteratorSyncQueue], ^{
        if (anObject) {
            NSUInteger zzIndex = index > CFArrayGetCount(self->_array) ? CFArrayGetCount(self->_array) : index;
            CFArraySetValueAtIndex(self->_array, zzIndex, (__bridge const void *)anObject);
        }
    });
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    dispatch_barrier_async([ZZIteratorQueue iteratorSyncQueue], ^{
        if (index < CFArrayGetCount(self->_array)) {
            CFArrayRemoveValueAtIndex(self->_array, index);
        }
    });
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    dispatch_barrier_async([ZZIteratorQueue iteratorSyncQueue], ^{
        if (anObject && index < CFArrayGetCount(self->_array)) {
            CFArraySetValueAtIndex(self->_array, index, (__bridge const void *)anObject);
        }
    });
}

- (void)removeLastObject
{
    dispatch_barrier_async([ZZIteratorQueue iteratorSyncQueue], ^{
        if (CFArrayGetCount(self->_array) > 0) {
            CFArrayRemoveValueAtIndex(self->_array, CFArrayGetCount(self->_array)-1);
        }
    });
}

- (void)removeAllObjects
{
    dispatch_barrier_async([ZZIteratorQueue iteratorSyncQueue], ^{
        CFArrayRemoveAllValues(self->_array);
    });
}

- (NSUInteger)count
{
    __block NSUInteger ret;
    dispatch_sync([ZZIteratorQueue iteratorSyncQueue], ^{
        ret = CFArrayGetCount(self->_array);
    });
    return ret;
}

- (id)firstObject
{
    return [self objectAtIndex:0];
}

- (id)lastObject
{
    return [self objectAtIndex:CFArrayGetCount(self->_array)-1];
}

- (NSUInteger)indexOfObject:(id)anObject
{
    if (!anObject) return NSNotFound;
    
    __block NSUInteger ret;
    dispatch_sync([ZZIteratorQueue iteratorSyncQueue], ^{
        ret = CFArrayGetFirstIndexOfValue(self->_array, CFRangeMake(0, CFArrayGetCount(self->_array)), (__bridge const void *)(anObject));
    });
    return ret;
}

- (id)objectAtIndex:(NSUInteger)index
{
//    NSAssert(index < CFArrayGetCount(self->_array), ([NSString stringWithFormat:@"%@:index %zd beyond bounds [0 .. %lu]", NSStringFromSelector(_cmd), index, (unsigned long)(CFArrayGetCount(self->_array)-1)]));
    
    __block id ret;
    dispatch_sync([ZZIteratorQueue iteratorSyncQueue], ^{
        if (index < CFArrayGetCount(self->_array)) {
            ret = CFArrayGetValueAtIndex(self->_array, index);
        } else ret = nil;
    });
    return ret;
}

@end
