//
//  ZZPrototypeResume.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZPrototypeWorkHistory.h"

@interface ZZPrototypeResume : NSObject<NSCopying>

- (void)setResumeName:(NSString *)name;

- (void)setResumeInfoWithAge:(NSString *)age sex:(NSString *)sex;

- (void)setResumeWorkWithCompany:(NSString *)company date:(NSString *)date;

@end
