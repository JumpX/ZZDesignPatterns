//
//  ZZHashTable.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZZHashKey : NSObject

@property (nonatomic, copy) NSString *key;

+ (ZZHashKey *)createHashKey:(NSString *)key;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

@interface ZZHashNode : NSObject

@property (nonatomic, strong) ZZHashKey *hashKey;
@property (nonatomic, strong) id value;
@property (nonatomic, strong) ZZHashNode *nextNode;

+ (ZZHashNode *)createHashNode:(ZZHashKey *)hashKey value:(id)value;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

@interface ZZHashTable : NSObject

@property (nonatomic, readonly, assign) NSInteger count;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
 *  生成哈希表
 *
 *  @param size         哈希表大小
 *  @param factor       加载因子
 *  @return ZZHashTable
 */
+ (ZZHashTable *)createHashTable:(NSInteger)size factor:(CGFloat)factor;

/**
 *  生成哈希表（size=16，factor=0.75）
 */
+ (ZZHashTable *)createHashTable;

/**
 *  获取ZZHashNode
 */
- (ZZHashNode *)getHashNode:(ZZHashKey *)hashKey;

/**
 *  增加ZZHashNode
 */
- (void)addHashNode:(ZZHashNode *)hashNode;

/**
 *  移除ZZHashNode
 */
- (void)removeHashNode:(ZZHashNode *)hashNode;
- (void)removeAllHashNodes;

/**
 *  哈希表扩容
 */
- (BOOL)shouldResizeHashTable;
- (void)resizeHashTable;

@end
