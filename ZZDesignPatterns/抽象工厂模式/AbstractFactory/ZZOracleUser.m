//
//  ZZOracleUser.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZOracleUser.h"

@implementation ZZOracleUser

- (void)insertUser:(ZZUser *)user
{
    NSLog(@"Oracle insertUser");
}

- (ZZUser *)queryUserByID:(NSInteger)ID
{
    NSLog(@"SQL queryUser");
    return nil;
}

@end
