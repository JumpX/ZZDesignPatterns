//
//  ZZBuilderBuilder.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZBuilderProduct.h"

@interface ZZBuilderBuilder : NSObject

@property (nonatomic, strong) ZZBuilderProduct *product;

- (void)buildPartSystem;
- (void)buildPartSoftware;
- (void)buildPartBrand;

@end
