//
//  ZZMediatorUN.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZMediatorCountry.h"

@interface ZZMediatorUN : NSObject

- (void)say:(NSString *)message country:(ZZMediatorCountry *)country;

@end
