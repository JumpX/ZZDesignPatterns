//
//  ZZHashTable.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZHashTable.h"

@implementation ZZHashKey

+ (ZZHashKey *)createHashKey:(NSString *)key
{
    if (!key || key.length == 0) return nil;
    
    ZZHashKey *hashKey = [[[self class] alloc] init];
    hashKey.key = key;
    return hashKey;
}

@end

@implementation ZZHashNode

+ (ZZHashNode *)createHashNode:(ZZHashKey *)hashKey value:(id)value
{
    if (!hashKey || !value) return nil;
    
    ZZHashNode *hashNode = [[[self class] alloc] init];
    hashNode.hashKey = hashKey;
    hashNode.value = value;
    return hashNode;
}

@end

@interface ZZHashTable ()
{
    dispatch_semaphore_t _lock;
}

@property (nonatomic, strong) NSMutableArray *hashTable;    //承载数组
@property (nonatomic, assign) CGFloat factor;               //加载因子
@property (nonatomic, assign) NSInteger size;               //数组大小

@end

@implementation ZZHashTable

+ (ZZHashTable *)createHashTable
{
    return [ZZHashTable createHashTable:16 factor:0.75];
}

+ (ZZHashTable *)createHashTable:(NSInteger)size factor:(CGFloat)factor
{
    return [[[self class] alloc] initWithSize:size factor:factor];
}

- (instancetype)initWithSize:(NSInteger)size factor:(CGFloat)factor
{
    if (self = [super init]) {
        _size = size;
        _factor = factor;
        _lock = dispatch_semaphore_create(1);
        _hashTable = [NSMutableArray arrayWithCapacity:size];
        for (NSInteger i = 0; i < size; i ++) {
            [_hashTable addObject:[NSNull null]];
        }
    }
    return self;
}

- (NSInteger)count
{
    __block NSInteger count = 0;
    [self.hashTable enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj && ![obj isKindOfClass:[NSNull class]] && obj != [NSNull null]) {
            count ++;
        }
    }];
    NSLog(@"HashTable >>>> size:%zd factor:%f", _size, _factor);
    return count;
}

- (NSInteger)hashCode:(ZZHashKey *)hashKey
{
    if (hashKey && hashKey.key.length > 0) {
        return ([hashKey.key hash])&(_size-1);
    }
    return 0;
}

- (ZZHashNode *)getHashNode:(ZZHashKey *)hashKey
{
    if (!hashKey || !hashKey.key || hashKey.key.length == 0) return nil;
    NSInteger index = [self hashCode:hashKey];
    id obj = [self.hashTable objectAtIndex:index];
    if (!obj || ![obj isKindOfClass:[ZZHashNode class]]) return nil;
    
    ZZHashNode *hashNode = [self.hashTable objectAtIndex:index];
    while (hashNode) {
        if ([hashNode.hashKey.key isEqualToString:hashKey.key]) {
            return hashNode;
        }
        hashNode = hashNode.nextNode;
    }
    return nil;
}

- (void)addHashNode:(ZZHashNode *)hashNode
{
    if (!hashNode || ![hashNode isKindOfClass:[ZZHashNode class]]) return;
    dispatch_semaphore_wait(_lock, DISPATCH_TIME_FOREVER);
    [self p_addHashNode:hashNode];
    if ([self shouldResizeHashTable]) [self p_resizeHashTable];
    dispatch_semaphore_signal(_lock);
}

- (void)removeHashNode:(ZZHashNode *)hashNode
{
    if (!hashNode || ![hashNode isKindOfClass:[ZZHashNode class]]) return;
    dispatch_semaphore_wait(_lock, DISPATCH_TIME_FOREVER);
    [self p_removeHashNode:hashNode];
    dispatch_semaphore_signal(_lock);
}

- (void)removeAllHashNodes
{
    dispatch_semaphore_wait(_lock, DISPATCH_TIME_FOREVER);
    [self.hashTable removeAllObjects];
    for (NSInteger i = 0; i < _size; i ++) {
        [self.hashTable addObject:[NSNull null]];
    }
    dispatch_semaphore_signal(_lock);
}

- (void)resizeHashTable
{
    dispatch_semaphore_wait(_lock, DISPATCH_TIME_FOREVER);
    [self p_resizeHashTable];
    dispatch_semaphore_signal(_lock);
}

- (BOOL)shouldResizeHashTable
{
    if (_factor*_size < self.count) {
        return YES;
    }
    return NO;
}

#pragma mark - private method

- (void)p_addHashNode:(ZZHashNode *)hashNode
{
    NSInteger index = [self hashCode:hashNode.hashKey];
    ZZHashNode *obj = [self.hashTable objectAtIndex:index];
    if (obj && [obj isKindOfClass:[ZZHashNode class]]) {
        hashNode.nextNode = obj;
    }
    [self.hashTable replaceObjectAtIndex:index withObject:hashNode];
}

- (void)p_removeHashNode:(ZZHashNode *)hashNode
{
    [self.hashTable enumerateObjectsUsingBlock:^(ZZHashNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj && [obj isKindOfClass:[ZZHashNode class]]) {
            if (obj == hashNode) {
                [self.hashTable replaceObjectAtIndex:idx withObject:[NSNull null]];
                *stop = YES;
            }
            while (obj.nextNode) {
                if (obj.nextNode == hashNode) {
                    obj.nextNode = nil;
                    *stop = YES;
                } else {
                    obj = obj.nextNode;
                }
            }
        }
    }];
}

- (void)p_resizeHashTable
{
    NSMutableArray *oldHashTable = [NSMutableArray arrayWithArray:self.hashTable];
    [self.hashTable removeAllObjects];
    _size = _size*2;
    for (NSInteger i = 0; i < _size; i ++) {
        [self.hashTable addObject:[NSNull null]];
    }
    [oldHashTable enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj && [obj isKindOfClass:[ZZHashNode class]]) {
            NSMutableArray <ZZHashNode *>*nodeList = [NSMutableArray new];
            ZZHashNode *node = (ZZHashNode *)obj;
            while (node) {
                [nodeList addObject:node];
                if (node.nextNode) {
                    node = node.nextNode;
                } else {
                    node = nil;
                }
            }
            [nodeList enumerateObjectsUsingBlock:^(ZZHashNode * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
                node.nextNode = nil;
                [self p_addHashNode:node];
            }];
        }
    }];
}

@end
