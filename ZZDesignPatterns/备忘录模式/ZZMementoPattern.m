//
//  ZZMementoPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMementoPattern.h"
#import "ZZMementoRole.h"
#import "ZZMementoRoleCaretaker.h"

@implementation ZZMementoPattern

+ (void)show
{
    // 角色
    ZZMementoRole *role = [ZZMementoRole new];
    [role initRole];
    [role display];
    
    // 存档管理者
    ZZMementoRoleCaretaker *caretaker = [ZZMementoRoleCaretaker new];
    caretaker.memento = [role backup];// 存档
    
    // 浴血奋战
    [role bloodFight];
    [role display];
    
    [role loadMemento:caretaker.memento];// 读档
    [role display];
}

@end
