//
//  ZZStateWork.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZZStateStatus;
@interface ZZStateWork : NSObject

@property (nonatomic, assign) NSUInteger        hour;
@property (nonatomic, strong) ZZStateStatus     *status;
@property (nonatomic, assign) BOOL              isFinished;

- (void)dosomeWork;

@end
