//
//  ZZManger.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZZManger : NSObject

@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, strong)   ZZManger    *superior;

- (void)handleRequest:(ZZRequest *)request;

@end

NS_ASSUME_NONNULL_END
