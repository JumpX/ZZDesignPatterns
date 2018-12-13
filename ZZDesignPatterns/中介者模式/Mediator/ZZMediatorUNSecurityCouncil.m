//
//  ZZMediatorUNSecurityCouncil.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMediatorUNSecurityCouncil.h"

@implementation ZZMediatorUNSecurityCouncil

- (void)say:(NSString *)message country:(ZZMediatorCountry *)country
{
    if (country == self.China) {
        [self.America getMessage:message];
    } else {
        [self.China getMessage:message];
    }
}

@end
