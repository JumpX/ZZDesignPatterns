//
//  ZZOracleServer.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZOracleServer.h"
#import "ZZOracleUser.h"
#import "ZZOracleDepartment.h"

@implementation ZZOracleServer

- (ZZUser *)createUser
{
    return [ZZOracleUser new];
}

- (ZZDepartment *)createDepartment
{
    return [ZZOracleDepartment new];
}

@end
