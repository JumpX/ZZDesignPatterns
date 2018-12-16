//
//  ZZNotification.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/16.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString *ZZNotificationName;

@class NSOperationQueue;

NS_ASSUME_NONNULL_BEGIN

@interface ZZNotification : NSObject<NSCopying>

@property (readonly, copy) ZZNotificationName name;
@property (nullable, readonly, retain) id object;
@property (nullable, readonly, copy) NSDictionary *userInfo;

- (instancetype)initWithName:(ZZNotificationName)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo;

@end

@interface ZZNotification (ZZNotificationCreation)

+ (instancetype)notificationWithName:(ZZNotificationName)aName object:(nullable id)anObject;
+ (instancetype)notificationWithName:(ZZNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

+ (instancetype)new __attribute__((unavailable("use -initWithName:object:userInfo instead")));
- (instancetype)init __attribute__((unavailable("use -initWithName:object:userInfo instead")));

@end

@interface ZZNotificationCenter : NSObject

@property (class, readonly, strong) ZZNotificationCenter *defaultCenter;

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable ZZNotificationName)aName object:(nullable id)anObject;

- (void)postNotification:(ZZNotification *)notification;
- (void)postNotificationName:(ZZNotificationName)aName object:(nullable id)anObject;
- (void)postNotificationName:(ZZNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(nullable ZZNotificationName)aName object:(nullable id)anObject;

- (id <NSObject>)addObserverForName:(nullable ZZNotificationName)name object:(nullable id)obj queue:(nullable NSOperationQueue *)queue usingBlock:(void (^)(ZZNotification *note))block;

@end

NS_ASSUME_NONNULL_END
