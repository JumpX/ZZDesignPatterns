//
//  ZZDecoratorFinery.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/12.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZDecoratorFinery.h"

@interface ZZDecoratorFinery ()

@property (nonatomic, strong) ZZDecoratorPerson *person;

@end

@implementation ZZDecoratorFinery

- (void)decorate:(ZZDecoratorPerson *)something
{
    self.person = something;
}

- (void)show
{
    if (self.person) {
        [self.person show];
    }
}

@end
