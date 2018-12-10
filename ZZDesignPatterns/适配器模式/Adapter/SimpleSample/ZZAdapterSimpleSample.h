//
//  ZZAdapterSimpleSample.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZAdapterSimpleSample : NSObject

- (void)sampleRequest;

@end

@interface ZZAdapterSimpleTarget : NSObject

- (void)request;

@end

@interface ZZAdapterSimpleAdapter : ZZAdapterSimpleTarget

- (void)request;

@end



