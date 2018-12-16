//
//  ZZDecoratorPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/12.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZDecoratorPattern.h"
#import "ZZDecoratorHat.h"
#import "ZZDecoratorTShirt.h"
#import "ZZDecoratorShoes.h"

@implementation ZZDecoratorPattern

+ (void)show
{
    // 正常顺序装饰 人名->帽子->T恤->鞋子
    [ZZDecoratorPattern normalDecorates];
    
    NSLog(@"\n >>>> compare");
    
    // 随意按需装饰 ?->?->?->?->...(大概这就是装饰模式的魅力吧)
    [ZZDecoratorPattern randomDecorates];
}

+ (void)normalDecorates
{
    ZZDecoratorPerson *person = [ZZDecoratorPerson new];
    person.name = @"赵丽颖";
    
    ZZDecoratorHat *hat = [ZZDecoratorHat new];
    ZZDecoratorTShirt *tShirt = [ZZDecoratorTShirt new];
    ZZDecoratorShoes *shoes = [ZZDecoratorShoes new];
    
    [shoes decorate:person];
    [tShirt decorate:shoes];
    [hat decorate:tShirt];
    [hat show];
}

+ (void)randomDecorates
{
    ZZDecoratorPerson *person = [ZZDecoratorPerson new];
    person.name = @"赵丽颖";

    ZZDecoratorHat *hat = [ZZDecoratorHat new];
    ZZDecoratorTShirt *tShirt = [ZZDecoratorTShirt new];
    ZZDecoratorShoes *shoes = [ZZDecoratorShoes new];
    
    [tShirt decorate:hat];
    [shoes decorate:tShirt];
    [hat decorate:person];

    [shoes show];
}

@end
