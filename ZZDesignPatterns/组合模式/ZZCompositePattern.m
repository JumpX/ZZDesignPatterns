//
//  ZZCompositePattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZCompositePattern.h"
#import "ZZCompositeLeaf.h"

@implementation ZZCompositePattern

+ (void)show
{
    // root
    ZZCompositeNode *composite = [ZZCompositeNode node:@"<<compositeRoot>>"];
    
    // nodes
    ZZCompositeNode *nodeA = [ZZCompositeNode node:@"<nodeA>"];
    ZZCompositeNode *nodeB = [ZZCompositeNode node:@"<nodeB>"];
    ZZCompositeNode *nodeC = [ZZCompositeNode node:@"<nodeC>"];
    ZZCompositeNode *nodeD = [ZZCompositeNode node:@"<nodeD>"];
    ZZCompositeNode *nodeE = [ZZCompositeNode node:@"<nodeE>"];
    ZZCompositeLeaf *leaf1 = [ZZCompositeLeaf node:@"Leaf1"];
    ZZCompositeLeaf *leaf2 = [ZZCompositeLeaf node:@"Leaf2"];
    ZZCompositeLeaf *leaf3 = [ZZCompositeLeaf node:@"Leaf3"];
    
    // add node
    [nodeA addNode:leaf2];
    [leaf2 addNode:nodeB];
    [composite addNode:leaf1];
    [composite addNode:nodeA];
    [composite addNode:nodeB];
    [nodeB addNode:nodeC];
    [nodeC addNode:nodeD];
    [nodeD addNode:nodeE];
    [nodeD addNode:leaf3];
    
    // display root
    [composite display:1];
    
    NSLog(@"\n >>>> root remove nodes and display:");
    [composite removeNode:leaf1];
    [nodeD removeNode:nodeC];
    [composite display:1];
    
    NSLog(@"\n >>>> nodeC display:");
    [nodeC display:1];
}

@end
