//
//  ZZNotification.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/16.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZNotification.h"

typedef void(^ZZNotificationBlock)(ZZNotification *);

@implementation ZZNotification

- (instancetype)initWithName:(ZZNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo
{
    if (self = [super init]) {
        _name = name;
        _object = object;
        _userInfo = userInfo;
    }
    return self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone
{
    return self;
}

@end

@implementation ZZNotification (ZZNotificationCreation)

+ (instancetype)notificationWithName:(ZZNotificationName)aName object:(id)anObject
{
    return [self notificationWithName:aName object:anObject userInfo:nil];
}

+ (instancetype)notificationWithName:(ZZNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    ZZNotification *notification = [[[self class] alloc] initWithName:aName object:anObject userInfo:aUserInfo];
    return notification;
}

@end

@interface ZZObserverModel : NSObject

@property (nullable, nonatomic, copy) ZZNotificationName name;
@property (nullable, nonatomic, strong) id observer;
@property (nullable, nonatomic, strong) id object;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, copy) ZZNotificationBlock block;

@end

@implementation ZZObserverModel

+ (instancetype)modelWithObserver:(id)observer name:(ZZNotificationName)name selector:(SEL)selector object:(id)object
{
    return [self modelWithObserver:observer name:name selector:selector object:object queue:nil block:nil];
}

+ (instancetype)modelWithObserver:(id)observer name:(ZZNotificationName)name selector:(SEL)selector object:(id)object queue:(NSOperationQueue *)queue block:(ZZNotificationBlock)block
{
    ZZObserverModel *model = [[[self class] alloc] init];
    model.observer = observer;
    model.name = name;
    model.selector = selector;
    model.object = object;
    model.queue = queue;
    model.block = block;
    return model;
}

@end

@interface ZZNotificationCenter ()

@property (nullable, nonatomic, strong) NSMutableDictionary <NSString*, NSMutableArray<ZZObserverModel *>*>*observersDictionary;

@end

@implementation ZZNotificationCenter
@dynamic defaultCenter;

- (instancetype)init
{
    if (self = [super init]) {
        _observersDictionary = [NSMutableDictionary new];
    }
    return self;
}

+ (ZZNotificationCenter *)defaultCenter
{
    static ZZNotificationCenter *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ZZNotificationCenter alloc] init];
    });
    return sharedInstance;
}

#pragma mark - addObserver

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(ZZNotificationName)aName object:(id)anObject
{
    if (aName) {
        ZZObserverModel *model = [ZZObserverModel modelWithObserver:observer name:aName selector:aSelector object:anObject];
        NSMutableArray *observers = self.observersDictionary[aName];
        if (!observers) {
            observers = [NSMutableArray new];
        }
        [observers addObject:model];
        self.observersDictionary[aName] = observers;
    }
}

- (id<NSObject>)addObserverForName:(ZZNotificationName)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(ZZNotification * _Nonnull))block
{
    if (name) {
        ZZObserverModel *model = [ZZObserverModel modelWithObserver:nil name:name selector:nil object:obj queue:queue block:block];
        NSMutableArray *observers = self.observersDictionary[name];
        if (!observers) {
            observers = [NSMutableArray new];
        }
        [observers addObject:model];
        self.observersDictionary[name] = observers;
    }
    return nil;
}

#pragma mark - postNotification

- (void)postNotification:(ZZNotification *)notification
{
    if (notification.name) {
        NSArray <ZZObserverModel *>*observers = self.observersDictionary[notification.name];
        [observers enumerateObjectsUsingBlock:^(ZZObserverModel * _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
            if (model.queue) {
                NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
                    model.block(notification);
                }];
                NSOperationQueue *queue = model.queue;
                [queue addOperation:operation];
            } else {
                id observer = model.observer;
                SEL selector = model.selector;
                if (observer && [observer respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                    [observer performSelector:selector withObject:notification];
#pragma clang diagnostic pop
                }
            }
/*
            // 或者用消息转发
            NSMethodSignature *methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
            SEL sel = observer.selector;
            if ([observer.observer respondsToSelector:sel]) {
                [invocation setTarget:observer.observer];
                [invocation setSelector:sel];
                [invocation setArgument:&notification atIndex:2];
                [invocation invoke];
            }
 */
        }];
    }
}

- (void)postNotificationName:(ZZNotificationName)aName object:(id)anObject
{
    [self postNotification:[ZZNotification notificationWithName:aName object:anObject]];
}

- (void)postNotificationName:(ZZNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    [self postNotification:[ZZNotification notificationWithName:aName object:anObject userInfo:aUserInfo]];
}

#pragma mark - removeObserver

- (void)removeObserver:(id)observer
{
    [self removeObserver:observer name:nil object:nil];
}

- (void)removeObserver:(id)observer name:(ZZNotificationName)aName object:(id)anObject
{
    [[self.observersDictionary allValues] enumerateObjectsUsingBlock:^(NSMutableArray<ZZObserverModel *> * _Nonnull observers, NSUInteger idx, BOOL * _Nonnull stop) {
        [observers enumerateObjectsUsingBlock:^(ZZObserverModel * _Nonnull anObserver, NSUInteger idx, BOOL * _Nonnull stop) {
            if (observer && observer == anObserver.observer) {
                if (!aName || [anObserver.name isEqualToString:aName]) {
                    if (!anObject || anObserver.object == anObject) {
                        [observers removeObject:anObserver];
                    }
                }
            }
        }];
    }];
}

@end
