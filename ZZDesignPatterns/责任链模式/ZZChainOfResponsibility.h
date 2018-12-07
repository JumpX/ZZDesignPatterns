//
//  ZZChainOfResponsibility.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZManger.h"
#import "ZZMangerLow.h"
#import "ZZMangerMid.h"
#import "ZZMangerHigh.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZZChainOfResponsibility : NSObject

+ (void)showZZChainOfResponsibility;

@end

NS_ASSUME_NONNULL_END
