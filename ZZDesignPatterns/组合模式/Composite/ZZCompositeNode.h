//
//  ZZCompositeNode.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZCompositeNode : NSObject

+ (instancetype)node:(NSString *)name;

- (NSString *)name;

- (void)addNode:(ZZCompositeNode *)node;
- (void)removeNode:(ZZCompositeNode *)node;
- (void)display:(NSInteger)depth;

@end
