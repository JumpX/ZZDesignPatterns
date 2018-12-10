//
//  ZZIterator.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZMutableArray.h"

@interface ZZIterator : NSObject

+ (instancetype)iteratorWithArray:(ZZMutableArray *)zzArray;

- (id)firstObject;
- (id)nextObject;
- (id)currentObject;
- (BOOL)isDone;

- (void)iteratorObjectsUsingBlock:(void(^)(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop))block;

@end
