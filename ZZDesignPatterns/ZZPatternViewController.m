//
//  ZZPatternViewController.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZPatternViewController.h"
#import "ZZPatternModel.h"

// 23种设计模式
//#import "ZZFactoryMethodPattern.h"
//#import "ZZAbstractFactoryPattern.h"
//#import "ZZBuilderPattern.h"
//#import "ZZPrototypePattern.h"
//#import "ZZSingletonPattern.h"
//#import "ZZAdapterPattern.h"
//#import "ZZBridgePattern.h"
//#import "ZZCompositePattern.h"
//#import "ZZDecoratorPattern.h"
//#import "ZZFacadePatterm.h"
//#import "ZZFlyweightPattern.h"
//#import "ZZProxyPattern.h"
//#import "ZZChainOfResponsibilityPattern.h"
//#import "ZZCommandPattern.h"
//#import "ZZInterpreterPattern.h"
//#import "ZZIteratorPattern.h"
//#import "ZZMediatorPattern.h"
//#import "ZZMementoPattern.h"
//#import "ZZObserverPattern.h"
//#import "ZZStatePattern.h"
//#import "ZZStrategyPattern.h"
//#import "ZZTemplateMethodPattern.h"
//#import "ZZVisitorPattern.h"

#define ZZSCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define ZZSCREEN_Height [[UIScreen mainScreen] bounds].size.height

@interface ZZPatternViewController ()

@property (nonatomic, strong) ZZPatternModel *pattern;

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *enNameLabel;
@property (strong, nonatomic) UILabel *typeLabel;
@property (strong, nonatomic) UILabel *descLabel;
@property (strong, nonatomic) UILabel *demoLabel;

@end

@implementation ZZPatternViewController

- (instancetype)initWithPattern:(ZZPatternModel *)pattern
{
    if (self = [super init]) {
        self.pattern = pattern;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.pattern.name;
    self.nameLabel.text = self.pattern.name;
    self.enNameLabel.text = self.pattern.enName;
    self.typeLabel.text = [NSString stringWithFormat:@"类型：%@", self.pattern.type];
    self.demoLabel.text = [NSString stringWithFormat:@"Demo：%@", self.pattern.demo];
    self.descLabel.text = [NSString stringWithFormat:@"描述：%@", self.pattern.desc];
    [self.descLabel sizeToFit];
    
    [NSClassFromString(self.pattern.demo) performSelectorInBackground:@selector(show) withObject:nil];
//    23种设计模式
//    [ZZFactoryMethodPattern show];/*1.工厂方法模式*/
//    [ZZAbstractFactoryPattern show];/*2.抽象工厂模式*/
//    [ZZBuilderPattern show];/*3.建造者模式*/
//    [ZZPrototypePattern show];/*4.原型模式*/
//    [ZZSingletonPattern show];/*5.单例模式*/
//    [ZZAdapterPattern show];/*6.适配器模式*/
//    [ZZBridgePattern show];/*7.桥接模式*/
//    [ZZCompositePattern show];/*8.组合模式*/
//    [ZZDecoratorPattern show];/*9.装饰模式*/
//    [ZZFacadePatterm show];/*10.外观模式*/
//    [ZZFlyweightPattern show];/*11.享元模式*/
//    [ZZProxyPattern show];/*12.代理模式*/
//    [ZZChainOfResponsibilityPattern show];/*13.责任链模式*/
//    [ZZCommandPattern show];/*14.命令模式*/
//    [ZZInterpreterPattern show];/*15.解释器模式*/
//    [ZZIteratorPattern show];/*16.迭代器模式*/
//    [ZZMediatorPattern show];/*17.中介者模式*/
//    [ZZMementoPattern show];/*18.备忘录模式*/
//    [ZZObserverPattern show];/*19.观察者模式*/
//    [ZZStatePattern show];/*20.状态模式*/
//    [ZZStrategyPattern show];/*21.策略模式*/
//    [ZZTemplateMethodPattern show];/*22.模板方法模式*/
//    [ZZVisitorPattern show];/*23.访问者模式*/
}

#pragma mark - UI

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 115, ZZSCREEN_WIDTH-60, 35)];
        _nameLabel.font = [UIFont boldSystemFontOfSize:24];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)enNameLabel
{
    if (!_enNameLabel) {
        _enNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 150, ZZSCREEN_WIDTH-60, 30)];
        _enNameLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:18];
        _enNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_enNameLabel];
    }
    return _enNameLabel;
}

- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 260, ZZSCREEN_WIDTH-60, 35)];
        _typeLabel.font = [UIFont systemFontOfSize:20];
        _typeLabel.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:_typeLabel];
    }
    return _typeLabel;
}

- (UILabel *)demoLabel
{
    if (!_demoLabel) {
        _demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, ZZSCREEN_WIDTH-60, 40)];
        _demoLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:20];
        _demoLabel.textAlignment = NSTextAlignmentLeft;
        _demoLabel.textColor = [UIColor blueColor];
        [self.view addSubview:_demoLabel];
    }
    return _demoLabel;
}

- (UILabel *)descLabel
{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 350, ZZSCREEN_WIDTH-60, 40)];
        _descLabel.font = [UIFont boldSystemFontOfSize:20];
        _descLabel.textAlignment = NSTextAlignmentLeft;
        _descLabel.numberOfLines = 0;
        [self.view addSubview:_descLabel];
    }
    return _descLabel;
}

@end
