//
//  ZZIteratorQueue.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZIteratorQueue : NSObject

+ (dispatch_queue_t)iteratorSyncQueue;

@end
