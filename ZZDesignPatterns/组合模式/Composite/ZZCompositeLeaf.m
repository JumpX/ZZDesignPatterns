//
//  ZZCompositeLeaf.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZCompositeLeaf.h"

@implementation ZZCompositeLeaf

- (void)addNode:(ZZCompositeNode *)node
{
    NSLog(@"Cant Add A Leaf:%@!", [super name]);
}

- (void)removeNode:(ZZCompositeNode *)node
{
    NSLog(@"Cant Remove A Leaf:%@!", [super name]);
}

- (void)display:(NSInteger)depth
{
    NSMutableString *log = [NSMutableString new];
    for (NSInteger index = 0; index < depth; index ++) {
        [log appendString:@"- "];
    }
    [log appendFormat:@"%@", [super name]];
    NSLog(@"%@", log);
}

@end
