//
//  ZZBuilderProduct.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZBuilderProduct.h"

@interface ZZBuilderProduct ()

@property (nonatomic, strong) NSMutableArray *parts;

@end

@implementation ZZBuilderProduct

- (instancetype)init
{
    if (self = [super init]) {
        self.parts = [NSMutableArray new];
    }
    return self;
}

- (void)addPart:(NSString *)part
{
    [self.parts addObject:part];
}

- (void)show
{
    for (NSString *part in self.parts) {
        NSLog(@"%@", part);
    }
}

@end
