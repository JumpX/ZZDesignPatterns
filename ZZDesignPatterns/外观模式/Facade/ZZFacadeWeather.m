//
//  ZZFacadeWeather.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZFacadeWeather.h"

@interface ZZFacadeWeather ()

@property (nonatomic, strong) ZZFacadeSpring *spring;
@property (nonatomic, strong) ZZFacadeSummer *summer;
@property (nonatomic, strong) ZZFacadeAutumn *autumn;
@property (nonatomic, strong) ZZFacadeWinter *winter;

@end

@implementation ZZFacadeWeather

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.spring = [ZZFacadeSpring new];
        self.summer = [ZZFacadeSummer new];
        self.autumn = [ZZFacadeAutumn new];
        self.winter = [ZZFacadeWinter new];
    }
    return self;
}

- (void)shanghaiWeather
{
    NSLog(@"shanghaiWeather >>> ");
    [self.spring spring];
    [self.summer summer];
    [self.autumn autumn];
    [self.winter winter];
}

- (void)shenzhenWeather
{
    NSLog(@"shenzhenWeather >>> ");
    [self.spring spring];
    [self.summer summer];
    [self.autumn autumn];
}

- (void)kunmingWeather
{
    NSLog(@"kunmingWeather >>> ");
    [self.spring spring];
}

- (void)hainanWeather
{
    NSLog(@"hainanWeather >>> ");
    [self.spring spring];
    [self.summer summer];
}

@end
