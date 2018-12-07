//
//  ZZSingletonD.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZSingletonD : NSObject

+ (instancetype)sharedInstance;
+ (instancetype)new __attribute__((unavailable("use sharedInstance instead")));
- (instancetype)init __attribute__((unavailable("use sharedInstance instead")));
- (id)copy __attribute__((unavailable("use sharedInstance instead")));
- (id)mutableCopy __attribute__((unavailable("use sharedInstance instead")));

@property (nonatomic, copy) NSString *name;

@end
