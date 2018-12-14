//
//  ZZCompositeNode.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZCompositeNode.h"

@interface ZZCompositeNode ()

@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, strong)   NSMutableArray  *nodes;

@end

@implementation ZZCompositeNode

+ (instancetype)node:(NSString *)name
{
    ZZCompositeNode *node = [[[self class] alloc] init];
    node.name = name;
    return node;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nodes = [NSMutableArray new];
    }
    return self;
}

- (void)addNode:(ZZCompositeNode *)node
{
    [self.nodes addObject:node];
}

- (void)removeNode:(ZZCompositeNode *)node
{
    [self.nodes removeObject:node];
}

- (void)display:(NSInteger)depth
{
    NSMutableString *log = [NSMutableString new];
    for (NSInteger index = 0; index < depth; index ++) {
        [log appendString:@"- "];
    }
    [log appendFormat:@"%@", [self name]];
    NSLog(@"%@", log);
    for (ZZCompositeNode *node in self.nodes) {
        [node display:depth+2];
    }
}

@end
