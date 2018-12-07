//
//  ZZSingletonA.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZSingletonA : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, copy) NSString *name;

@end
