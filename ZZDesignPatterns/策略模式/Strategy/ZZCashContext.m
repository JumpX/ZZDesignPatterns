//
//  ZZCashContext.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZCashContext.h"
#import "ZZCashChargeNormal.h"
#import "ZZCashChargeFullReturn.h"
#import "ZZCashChargeDiscount.h"

@interface ZZCashContext ()

@property (nonatomic, strong) ZZCashCharge *cashCharge;

@end

@implementation ZZCashContext

+ (instancetype)contextWithCashType:(ZZCashType)type
{
    ZZCashContext *context = [[[self class] alloc] init];
    switch (type) {
        case ZZCashTypeNormal:
            context.cashCharge = [ZZCashChargeNormal new];
            break;
        case ZZCashTypeFullReturn:
            context.cashCharge = [ZZCashChargeFullReturn new];
            break;
        case ZZCashTypeDiscount:
            context.cashCharge = [ZZCashChargeDiscount new];
            break;
            
        default:
            break;
    }
    return context;
}

- (NSInteger)cashResult:(NSInteger)money
{
    return [self.cashCharge acceptCash:money];
}

@end
