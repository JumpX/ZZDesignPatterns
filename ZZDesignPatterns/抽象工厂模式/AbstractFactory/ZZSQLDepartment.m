//
//  ZZSQLDepartment.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZSQLDepartment.h"

@implementation ZZSQLDepartment

- (void)insertDepartment:(ZZDepartment *)department
{
    NSLog(@"SQL insertDepartment");
}

- (ZZDepartment *)queryDepartmentByID:(NSInteger)ID
{
    NSLog(@"SQL queryDepartmentByID");
    return nil;
}

@end
