//
//  ZZMediatorUNSecurityCouncil.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZMediatorUN.h"
#import "ZZMediatorChina.h"
#import "ZZMediatorAmerica.h"

@interface ZZMediatorUNSecurityCouncil : ZZMediatorUN

@property (nonatomic, strong) ZZMediatorChina   *China;
@property (nonatomic, strong) ZZMediatorAmerica *America;

@end
