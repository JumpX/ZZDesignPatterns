//
//  ZZFlyweightWebSite.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZFlyweightUser.h"

@interface ZZFlyweightWebSite : NSObject

+ (instancetype)webSiteWithName:(NSString *)name;

- (void)loadUser:(ZZFlyweightUser *)user;

@end
