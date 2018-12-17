//
//  ZZCashContext.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZZCashType)
{
    ZZCashTypeNormal,
    ZZCashTypeFullReturn,
    ZZCashTypeDiscount
};

@interface ZZCashContext : NSObject

+ (instancetype)contextWithCashType:(ZZCashType)type;

- (NSInteger)cashResult:(NSInteger)money;

@end
