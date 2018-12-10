//
//  ZZAdapterPlayerAdapter.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/10.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZAdapterPlayer.h"
#import "ZZAdapterPlayerCBA.h"

@interface ZZAdapterPlayerAdapter : ZZAdapterPlayer

- (void)attack;
- (void)defense;

@end
