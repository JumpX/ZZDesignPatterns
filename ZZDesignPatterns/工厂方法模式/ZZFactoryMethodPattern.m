//
//  ZZFactoryMethodPattern.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZFactoryMethodPattern.h"
#import "ZZOperationFactory.h"
#import "ZZAddFactory.h"
#import "ZZSubstractFactory.h"
#import "ZZMultiplyFactory.h"
#import "ZZDivideFactory.h"
#import "ZZPowerFactory.h"

@implementation ZZFactoryMethodPattern

+ (void)show
{
    // 简单工厂
    [ZZFactoryMethodPattern showSimpleFactory];
    // 工厂方法
    [ZZFactoryMethodPattern showFactoryMethod];
}

+ (void)showSimpleFactory
{
    // +
    ZZOperation *add = [ZZOperationFactory createOperation:ZZOperationTypeAdd];
    add.numberA = 10;
    add.numberB = 5;
    [add operationResult];
    
    // -
    ZZOperation *substract = [ZZOperationFactory createOperation:ZZOperationTypeSubtract];
    substract.numberA = 10;
    substract.numberB = 5;
    [substract operationResult];

    // *
    ZZOperation *multiply = [ZZOperationFactory createOperation:ZZOperationTypeMultiply];
    multiply.numberA = 10;
    multiply.numberB = 5;
    [multiply operationResult];

    // /
    ZZOperation *divide = [ZZOperationFactory createOperation:ZZOperationTypeDivide];
    divide.numberA = 10;
    divide.numberB = 5;
    [divide operationResult];
    
    // 次方
    ZZOperation *power = [ZZOperationFactory createOperation:ZZOperationTypePower];
    power.numberA = 10;
    power.numberB = 5;
    [power operationResult];
}

+ (void)showFactoryMethod
{
    // +
    ZZFactory *factory = [ZZAddFactory new];
    ZZOperation *operation = [factory createOperation];
    operation.numberA = 10;
    operation.numberB = 5;
    [operation operationResult];
    
    // -
    factory = [ZZSubstractFactory new];
    operation = [factory createOperation];
    operation.numberA = 10;
    operation.numberB = 5;
    [operation operationResult];

    // *
    factory = [ZZMultiplyFactory new];
    operation = [factory createOperation];
    operation.numberA = 10;
    operation.numberB = 5;
    [operation operationResult];

    // /
    factory = [ZZDivideFactory new];
    operation = [factory createOperation];
    operation.numberA = 10;
    operation.numberB = 5;
    [operation operationResult];
    
    // 次方
    factory = [ZZPowerFactory new];
    operation = [factory createOperation];
    operation.numberA = 10;
    operation.numberB = 5;
    [operation operationResult];
}

@end
