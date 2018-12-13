//
//  ZZVisitorActionLove.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZVisitorActionLove.h"

@implementation ZZVisitorActionLove

- (void)actionWithMan:(ZZVisitorMan *)man
{
    NSLog(@"man:%@ >>>> love!", man.name);
}

- (void)actionWithWoman:(ZZVisitorWoman *)woman
{
    NSLog(@"woman:%@ >>>> love!", woman.name);
}

@end
