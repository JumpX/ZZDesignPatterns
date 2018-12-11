//
//  ZZFacadeWeather.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZFacadeSpring.h"
#import "ZZFacadeSummer.h"
#import "ZZFacadeAutumn.h"
#import "ZZFacadeWinter.h"

@interface ZZFacadeWeather : NSObject

- (void)shanghaiWeather;
- (void)shenzhenWeather;
- (void)kunmingWeather;
- (void)hainanWeather;

@end
