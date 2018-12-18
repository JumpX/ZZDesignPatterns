//
//  ZZCommand.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCommandReceiver.h"

@interface ZZCommand : NSObject

@property (nonatomic, strong) ZZCommandReceiver *receiver;
@property (nonatomic, copy) NSString *action;

+ (instancetype)commandWithReceiver:(ZZCommandReceiver *)receiver;

- (void)execute;

@end
