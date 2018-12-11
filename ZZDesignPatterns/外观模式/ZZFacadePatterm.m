//
//  ZZFacadePatterm.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZFacadePatterm.h"
#import "ZZFacadeWeather.h"

@implementation ZZFacadePatterm

+ (void)showZZFacadePatterm
{
    ZZFacadeWeather *facade = [ZZFacadeWeather new];
    
    [facade kunmingWeather];
    [facade shenzhenWeather];
    [facade shanghaiWeather];
    [facade hainanWeather];
}

@end
