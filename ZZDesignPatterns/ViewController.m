//
//  ViewController.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/7.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ViewController.h"
#import "ZZBuilderPattern.h"
#import "ZZPrototypePattern.h"
#import "ZZSingletonPattern.h"
#import "ZZAdapterPattern.h"
#import "ZZBridgePattern.h"
#import "ZZCompositePattern.h"
#import "ZZDecoratorPattern.h"
#import "ZZFacadePatterm.h"
#import "ZZProxyPattern.h"
#import "ZZChainOfResponsibilityPattern.h"
#import "ZZInterpreterPattern.h"
#import "ZZIteratorPattern.h"
#import "ZZMediatorPattern.h"
#import "ZZMementoPattern.h"
#import "ZZObserverPattern.h"
#import "ZZStatePattern.h"
#import "ZZTemplateMethodPattern.h"
#import "ZZVisitorPattern.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZZBuilderPattern show];/*3.建造者模式*/
    [ZZPrototypePattern show];/*4.原型模式*/
    [ZZSingletonPattern show];/*5.单例模式*/
    [ZZAdapterPattern show];/*6.适配器模式*/
    [ZZBridgePattern show];/*7.桥接模式*/
    [ZZCompositePattern show];/*8.组合模式*/
    [ZZDecoratorPattern show];/*9.装饰模式*/
    [ZZFacadePatterm show];/*10.外观模式*/
    [ZZProxyPattern show];/*12.代理模式*/
    [ZZChainOfResponsibilityPattern show];/*13.责任链模式*/
    [ZZInterpreterPattern show];/*15.解释器模式*/
    [ZZIteratorPattern show];/*16.迭代器模式*/
    [ZZMediatorPattern show];/*17.中介者模式*/
    [ZZMementoPattern show];/*18.备忘录模式*/
    [ZZObserverPattern show];/*19.观察者模式*/
    [ZZStatePattern show];/*20.状态模式*/
    [ZZTemplateMethodPattern show];/*22.模板方法模式*/
    [ZZVisitorPattern show];/*23.访问者模式*/
}

@end
