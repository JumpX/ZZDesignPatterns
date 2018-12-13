//
//  ZZVisitorActionSuccess.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZVisitorActionSuccess.h"

@implementation ZZVisitorActionSuccess

- (void)actionWithMan:(ZZVisitorMan *)man
{
    NSLog(@"man:%@ >>>> success!", man.name);
}

- (void)actionWithWoman:(ZZVisitorWoman *)woman
{
    NSLog(@"woman:%@ >>>> success!", woman.name);
}

@end
