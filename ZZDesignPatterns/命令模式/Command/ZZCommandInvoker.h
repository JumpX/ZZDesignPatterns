//
//  ZZCommandInvoker.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZZCommand;
@interface ZZCommandInvoker : NSObject

- (void)addCommand:(ZZCommand *)command;
- (void)removeCommand:(ZZCommand *)command;

- (void)executeCommand;

@end
