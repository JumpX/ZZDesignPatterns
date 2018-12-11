//
//  ZZBuilderDirector.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZBuilderBuilder.h"

@interface ZZBuilderDirector : NSObject

- (void)makeProductWithBuilder:(ZZBuilderBuilder *)builder;

@end
