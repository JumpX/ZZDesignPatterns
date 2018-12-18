//
//  ZZWebSiteFactory.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZFlyweightWebSite.h"

@interface ZZWebSiteFactory : NSObject

- (ZZFlyweightWebSite *)webSiteWithKey:(NSString *)key;

- (void)removeAllWebSite;

- (NSInteger)webSiteCount;

@end
