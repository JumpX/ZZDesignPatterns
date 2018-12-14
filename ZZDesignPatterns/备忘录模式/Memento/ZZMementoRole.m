//
//  ZZMementoRole.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMementoRole.h"
#import "ZZMementoRoleMemento.h"

@implementation ZZMementoRole

- (void)initRole
{
    self.name = @"赵丽颖";
    self.site = @"女明星";
    self.level = @"18岁";
    self.state = @"很红";
    self.attack = @"100";
    self.defense = @"100";
    self.healthPoint = @"100";
}

- (void)bloodFight
{
    NSLog(@"\n打BOSS...");
    self.attack = @"30";
    self.defense = @"50";
    self.healthPoint = @"60";
}

- (void)display
{
    NSLog(@"Role >> :%@ %@ %@ %@ %@ %@ %@",self.name, self.site, self.level, self.state, self.attack, self.defense, self.healthPoint);
}

- (ZZMementoRoleMemento *)backup
{
    NSLog(@"存档...");
    return [ZZMementoRoleMemento createMemento:self.attack defense:self.defense healthPoint:self.healthPoint];
}

- (void)loadMemento:(ZZMementoRoleMemento *)memento
{
    NSLog(@"读档...");
    self.attack = memento.ATK;
    self.defense = memento.DEF;
    self.healthPoint = memento.HP;
}

@end
