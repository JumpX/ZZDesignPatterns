//
//  ZZVisitorActionFail.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZVisitorActionFail.h"

@implementation ZZVisitorActionFail

- (void)actionWithMan:(ZZVisitorMan *)man
{
    NSLog(@"man:%@ >>>> fail!", man.name);
}

- (void)actionWithWoman:(ZZVisitorWoman *)woman
{
    NSLog(@"woman:%@ >>>> fail!", woman.name);
}

@end
