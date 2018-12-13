//
//  ZZMediatorPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMediatorPattern.h"
#import "ZZMediatorUNSecurityCouncil.h"

@implementation ZZMediatorPattern

+ (void)showZZMediatorPattern
{
    ZZMediatorUNSecurityCouncil *mediator = [ZZMediatorUNSecurityCouncil new];
    ZZMediatorChina *China = [ZZMediatorChina new];
    ZZMediatorAmerica *America = [ZZMediatorAmerica new];
    mediator.China = China;
    mediator.America = America;
    China.mediator = mediator;
    America.mediator = mediator;
    
    [America say:@"America 称霸世界"];
    [China say:@"China 维护世界和平"];
}

@end
