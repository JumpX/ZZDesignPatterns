//
//  ZZDecoratorFinery.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/12.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZDecoratorPerson.h"

@interface ZZDecoratorFinery : ZZDecoratorPerson

- (void)decorate:(ZZDecoratorPerson *)something;

- (void)show;

@end
