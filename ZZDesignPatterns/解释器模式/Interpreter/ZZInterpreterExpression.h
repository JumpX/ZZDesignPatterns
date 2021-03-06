//
//  ZZInterpreterExpression.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZInterpreterContext.h"

@interface ZZInterpreterExpression : NSObject

- (void)interpreter:(ZZInterpreterContext *)context;

- (void)excute:(NSString *)letter;

@end
