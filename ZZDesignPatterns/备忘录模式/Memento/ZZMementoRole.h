//
//  ZZMementoRole.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZZMementoRoleMemento;
@interface ZZMementoRole : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *site;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *attack;
@property (nonatomic, copy) NSString *defense;
@property (nonatomic, copy) NSString *healthPoint;

- (void)initRole;
- (void)bloodFight;
- (void)display;

- (ZZMementoRoleMemento *)backup;
- (void)loadMemento:(ZZMementoRoleMemento *)memento;

@end
