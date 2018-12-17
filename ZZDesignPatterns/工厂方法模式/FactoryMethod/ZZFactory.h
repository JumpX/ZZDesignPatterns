//
//  ZZFactory.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZOperation.h"

@interface ZZFactory : NSObject

- (ZZOperation *)createOperation;

@end
