//
//  ZZPrototypeWorkHistory.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZPrototypeWorkHistory.h"

@implementation ZZPrototypeWorkHistory

- (id)copyWithZone:(NSZone *)zone
{
    ZZPrototypeWorkHistory *work = [[[self class] allocWithZone:zone] init];
    work.company = _company;
    work.workDate = _workDate;
    return work;
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> >>>> company:%@ >>>> workDate:%@", [self class], self, self.company, self.workDate];
}

@end
