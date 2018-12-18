//
//  ZZPatternModel.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZPatternModel : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *enName;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *demo;

+ (instancetype)patternWithID:(NSString *)ID name:(NSString *)name enName:(NSString *)enName type:(NSString *)type desc:(NSString *)desc demo:(NSString *)demo;

@end
