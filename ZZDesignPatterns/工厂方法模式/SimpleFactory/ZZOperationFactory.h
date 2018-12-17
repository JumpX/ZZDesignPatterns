//
//  ZZOperationFactory.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZOperation.h"

typedef NS_ENUM(NSInteger, ZZOperationType) {
    ZZOperationTypeAdd,
    ZZOperationTypeSubtract,
    ZZOperationTypeMultiply,
    ZZOperationTypeDivide,
    ZZOperationTypePower
};

@interface ZZOperationFactory : NSObject

+ (ZZOperation *)createOperation:(ZZOperationType)type;

@end
