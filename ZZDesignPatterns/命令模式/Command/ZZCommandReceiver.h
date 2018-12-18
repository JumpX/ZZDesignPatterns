//
//  ZZCommandReceiver.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZCommandReceiver : NSObject

@property (nonatomic, copy) NSString *name;

+ (instancetype)receiverWithName:(NSString *)name;

- (void)dosomething:(NSString *)action;

@end
