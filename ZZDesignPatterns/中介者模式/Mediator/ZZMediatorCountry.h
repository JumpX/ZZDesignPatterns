//
//  ZZMediatorCountry.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZZMediatorUN;
@interface ZZMediatorCountry : NSObject

@property (nonatomic, weak) ZZMediatorUN *mediator;

- (void)say:(NSString *)message;
- (void)getMessage:(NSString *)message;

@end
