//
//  ZZSingletonE.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/8.
//  Copyright © 2018 Jungle. All rights reserved.
//

#ifndef ZZSingletonE_h
#define ZZSingletonE_h

#define ZZSingletonINT(_type_) + (instancetype)sharedInstance;\
+ (instancetype)new __attribute__((unavailable("use sharedInstance instead")));\
- (instancetype)init __attribute__((unavailable("use sharedInstance instead")));\
- (id)copy __attribute__((unavailable("use sharedInstance instead")));\
- (id)mutableCopy __attribute__((unavailable("use sharedInstance instead")));\

#define ZZSingletonIMP(_type_) + (instancetype)sharedInstance {\
    static _type_ *instance;\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        if (!instance) {\
            instance = [[self alloc] init];\
        }\
    });\
    return instance;\
}\


#endif /* ZZSingletonE_h */
