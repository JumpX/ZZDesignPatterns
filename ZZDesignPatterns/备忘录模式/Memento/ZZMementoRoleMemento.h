//
//  ZZMementoRoleMemento.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZMementoRoleMemento : NSObject

+ (instancetype)createMemento:(NSString *)attack
                      defense:(NSString *)defense
                  healthPoint:(NSString *)healthPoint;

- (NSString *)ATK;
- (NSString *)DEF;
- (NSString *)HP;

@end
