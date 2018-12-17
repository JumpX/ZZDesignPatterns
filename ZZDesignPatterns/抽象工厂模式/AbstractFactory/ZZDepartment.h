//
//  ZZDepartment.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZDepartment : NSObject

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *name;

- (void)insertDepartment:(ZZDepartment *)department;
- (ZZDepartment *)queryDepartmentByID:(NSInteger)ID;

@end
