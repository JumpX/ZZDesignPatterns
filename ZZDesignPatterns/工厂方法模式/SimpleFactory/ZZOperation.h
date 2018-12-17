//
//  ZZOperation.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZOperation : NSObject

@property (nonatomic, assign) NSInteger numberA;
@property (nonatomic, assign) NSInteger numberB;

- (NSInteger)operationResult;

@end
