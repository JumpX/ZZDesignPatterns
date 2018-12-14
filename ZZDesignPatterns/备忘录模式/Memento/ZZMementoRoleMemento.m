//
//  ZZMementoRoleMemento.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMementoRoleMemento.h"

@interface ZZMementoRoleMemento ()

@property (nonatomic, copy) NSString *attack;
@property (nonatomic, copy) NSString *defense;
@property (nonatomic, copy) NSString *healthPoint;

@end

@implementation ZZMementoRoleMemento

+ (instancetype)createMemento:(NSString *)attack defense:(NSString *)defense healthPoint:(NSString *)healthPoint
{
    ZZMementoRoleMemento *memento = [[[self class] alloc] init];
    memento.attack = attack;
    memento.defense = defense;
    memento.healthPoint = healthPoint;
    return memento;
}

- (NSString *)ATK
{
    return self.attack;
}

- (NSString *)DEF
{
    return self.defense;
}

- (NSString *)HP
{
    return self.healthPoint;
}

@end
