//
//  ZZAbstractFactoryPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZAbstractFactoryPattern.h"
#import "ZZSQLServer.h"
#import "ZZOracleServer.h"

@implementation ZZAbstractFactoryPattern

+ (void)show
{
    // new data
    ZZUser *user = [ZZUser new];
    ZZDepartment *department = [ZZDepartment new];
    
    // iFactory
//    ZZServerFactory *iFactory = [ZZOracleServer new];// 只替换一处代码就可以替换数据库
    ZZServerFactory *iFactory = [ZZSQLServer new];
    
    // iUser
    ZZUser *iUser = [iFactory createUser];
    [iUser insertUser:user];
    [iUser queryUserByID:1];
    
    // iDepartment
    ZZDepartment *iDepartment = [iFactory createDepartment];
    [iDepartment insertDepartment:department];
    [iDepartment queryDepartmentByID:1];
}

@end
