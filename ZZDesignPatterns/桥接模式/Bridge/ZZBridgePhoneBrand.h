//
//  ZZBridgePhoneBrand.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/14.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZZBridgePhoneSoft;
@interface ZZBridgePhoneBrand : NSObject

@property (nonatomic, strong) ZZBridgePhoneSoft *soft;

- (void)runSoft;

@end
