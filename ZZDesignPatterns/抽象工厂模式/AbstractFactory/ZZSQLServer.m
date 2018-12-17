//
//  ZZSQLServer.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZSQLServer.h"
#import "ZZSQLUser.h"
#import "ZZSQLDepartment.h"

@implementation ZZSQLServer

- (ZZUser *)createUser
{
    return [ZZSQLUser new];
}

- (ZZDepartment *)createDepartment
{
    return [ZZSQLDepartment new];
}

@end
