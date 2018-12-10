//
//  ZZAdapterPlayer.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZAdapterPlayer.h"

@implementation ZZAdapterPlayer

- (void)setName:(NSString *)name
{
    _name = name;
    NSLog(@"%@", name);
}

- (void)attack
{
    NSLog(@"进攻");
}

- (void)defense
{
    NSLog(@"防守");
}

@end
