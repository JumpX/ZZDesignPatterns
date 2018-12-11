//
//  ZZPrototypeWorkHistory.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZPrototypeWorkHistory : NSObject<NSCopying>

@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *workDate;

@end
