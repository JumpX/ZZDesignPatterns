# ZZDesignPatterns


## 23种设计模式中英文

| Number | 模式 | Pattern |
|:------:|:---:|:-------:|
|1.|工厂方法模式|Factory Method Pattern|
|2.|抽象工厂模式|Abstract Factory Pattern|
|3.|建造者模式|Builder Pattern|
|4.|原型模式|Prototype Pattern|
|5.|单例模式|Singleton Pattern|
|6.|适配器模式|Adapter Pattern|
|7.|桥接模式|Bridge Pattern|
|8.|组合模式|Composite Pattern|
|9.|装饰模式|Decorator Pattern|
|10.|外观模式|Facade Pattern|
|11.|享元模式|Flyweight Pattern|
|12.|代理模式|Proxy pattern|
|13.|责任链模式|Chain of Responsibility Pattern|
|14.|命令模式|Command Pattern|
|15.|解释器模式|Interpreter Pattern|
|16.|迭代器模式|Iterator Pattern|
|17.|中介者模式|Mediator Pattern|
|18.|备忘录模式|Memento Pattern|
|19.|观察者模式|Observer Pattern|
|20.|状态模式|State Pattern|
|21.|策略模式|Strategy Pattern|
|22.|模板方法模式|Template Method Pattern|
|23.|访问者模式|Visitor Pattern|

## 设计模式类型

### 1.创建型模式（5种）

- 工厂方法模式
- 抽象工厂模式
- 建造者模式
- 原型模式
- 单例模式

### 2.结构型模式（7种）

- 适配器模式
- 桥接模式
- 组合模式
- 装饰模式
- 外观模式
- 享元模式
- 代理模式

### 3.行为型模式（11种）

- 职责链模式
- 命令模式
- 解释器模式
- 迭代器模式
- 中介者模式
- 备忘录模式
- 观察者模式
- 状态模式
- 策略模式
- 模板方法模式
- 访问者模式

## 概念：类和接口

- 类是对对象的抽象；
- 抽象类是对类的抽象；
- 接口是对行为的抽象。

## 四个大原则

#### 原则一：单一职责原则

单一职责原则：

- 就一个类而言，应该仅有一个引起它变化的原因。

换句话说，如果一个类承担的职责过多，就等于把这些职责耦合在一起，一个职责的变化可能会削弱或者抑制这个类完成其他职责的能力。这种耦合会导致脆弱的设计，当变化发生时，设计会遭受到意想不到的破坏。

比如设计一个俄罗斯方块游戏，游戏界面是容易变化的，而游戏逻辑是不太容易变化的，就需要考虑类额职责分离。

#### 原则二：开放-封闭原则

开放-封闭原则：

- 软件实体（类、模块、函数等）应该可以扩展，但是不可以修改。

即：

- 对于扩展是开放的
- 对于更改是封闭的

开放-封闭原则是面向对象设计的核心所在。我们应该对程序中呈现出频繁变化的那些部分做出抽离，但不应该把程序中的每个部分都刻意进行抽象。**抽象很重要，拒绝不成熟的抽象更重要！**

#### 原则三：依赖倒转原则

依赖倒转原则：

- A.高层模板不应该依赖底层模块。两个都应该依赖抽象。
- B.抽象不应该依赖细节，细节应该依赖于抽象。

简单点说，就是要针对接口编程，不要对实现编程。

#### 原则四：里氏代换原则

里氏代换原则：

- 子类型必须能够替换掉它们的父类型。

换句话说，一个软件实体如果使用的是一个父类的话，那么一定适用于其子类，而且它觉察不出父类对象和子类对象的区别。也就是说，在软件里面，把父类都替换成它的子类，程序的行为没有变化。也正因为有了这个原则，使得继承、复用、扩展成为了可能。

## 介绍各种模式

### 3.建造者模式

+ 建造者模式，可将复杂的建造过程抽象出3部分：
	- 要建造的产品（Product）
	- 多个不同的建造者（Builder1，Builder2，...继承：Builder）
	- 指挥如何建造的指挥者（Director）
+ 产品（Product），有两个功能：
	- 添加配件
	- 展示产品
+ 建造者（BuilderX）：
	- 添加配件A
	- 添加配件B
	- 添加配件C
	- 生成产品
+ 指挥者（Director）：
	- 指定建造者
	- 指定添加哪些配件
	- 拿到建造者生成的产品
	- 展示产品

### 4.原型模式（Prototype Pattern）

原型模式：用原型实例指定创建对象的种类，并且通过拷贝这些原型创建新的对象。

**本质是从一个对象再创建另外一个可定制的对象，而且不需要知道任何创建的细节。**

有些对象自带copy、mutableCopy方法：NSNumber、NSString、NSArray、NSDictionary、NSMutableArray、NSMutableDictionay、NSMutableString。**需要注意深浅拷贝的区别。**

对象实现 **NSCoping** 协议及`- (id)copyWithZone:(NSZone *)zone`
方法:

```
- (id)copyWithZone:(NSZone *)zone
{
    // 此处得用[self class]，否则子类调用copy协议会有问题
    ZZPrototypeResume *resume = [[[self class] allocWithZone:zone] init];
    resume.name = _name;
    resume.age = _age;
    resume.sex = _sex;
    resume.work = [_work copy];
    return resume;
}
```

### 5.单例模式（Singleton Pattern）

+ 实现方式主要分2种：

```
// 方式一：@synchronized （@synchronized本身影响性能，不建议）
// 为何两层 if (instance == nil) 判断？
// 外层，防止instance获取到后的无畏加锁影响性能;
// 内层，防止多个线程同时访问生成多个不同的instance；
+ (instancetype)sharedInstance
{
    static ZZSingletonB *instance;
    if (instance == nil) {
        @synchronized(self) {
            if (instance == nil) {
                instance = [[super allocWithZone:NULL] init];
            }
        }
    }
    return instance;
}
```

```
// 方式二：dispatch_once_t （苹果建议）
+ (instancetype)sharedInstance
{
    static ZZSingletonA *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[super allocWithZone:NULL] init];
        }
    });
    return instance;
}
```

+ 有三种方式，用于避免instance被new、init、copy、mutableCopy等方法重新创建

```
//方式一：重写new、init、copy、mutableCopy等方法

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [ZZSingletonA sharedInstance];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [ZZSingletonA sharedInstance];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [ZZSingletonA sharedInstance];
}
```

```
//方法二：NS_UNAVAILABLE 方法不可用
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (id)copy NS_UNAVAILABLE;
- (id)mutableCopy NS_UNAVAILABLE;
```

```
//方法三：__attribute__ unavailable 方法报错
+ (instancetype)new __attribute__((unavailable("use sharedInstance instead")));
- (instancetype)init __attribute__((unavailable("use sharedInstance instead")));
- (id)copy __attribute__((unavailable("use sharedInstance instead")));
- (id)mutableCopy __attribute__((unavailable("use sharedInstance instead")));
```

**方法一需要仔细，方法二太暴力，方法三很温柔，随你喜欢哪种，个人倾向于第三种。可以通过宏定义的方式，使用更简便：**

```
#define ZZSingletonINT(_type_) + (instancetype)sharedInstance;\
+ (instancetype)new __attribute__((unavailable("use sharedInstance instead")));\
- (instancetype)init __attribute__((unavailable("use sharedInstance instead")));\
- (id)copy __attribute__((unavailable("use sharedInstance instead")));\
- (id)mutableCopy __attribute__((unavailable("use sharedInstance instead")));\

#define ZZSingletonIMP(_type_) + (instancetype)sharedInstance {\
    static _type_ *instance;\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        if (!instance) {\
            instance = [[self alloc] init];\
        }\
    });\
    return instance;\
}\
```
调用：

```
@interface ZZSingletonE1 : NSObject

ZZSingletonINT(ZZSingletonE1)

@end

@implementation ZZSingletonE1

ZZSingletonIMP(ZZSingletonE1)

@end
```

### 6.适配器模式（Adapter Pattern）

适配器是当两个类具有相同作用和方法，但因为历史原因，方法名不一致，此时需要用适配器将特殊类的方法用普通类去实现。

**本质上是新建一个继承自普通类的子类，用该子类将特殊类包一层，在对应的普通方法中去调用特殊类的对应的特殊方法。**

两个简单的例子：

- ZZAdapterSimpleSample
- ZZAdapterPlayer

### 9.装饰模式（Decorator Pattern）

**装饰模式，动态的给一个对象添加一些额外额职责，就增加功能而言，装饰模式比生成子类更为灵活。**

装饰模式和建造者模式很相像，**区别在于建造者有个指挥者，按照给定的功能或者固定的顺序进行稳定的建造；而装饰模式不需要指挥者，可以给对象相对灵活的装饰。**

每个装饰对象只关心自己的功能，不关心如何被添加到对象链当中。

适用场合：

- **简化类。把类中的装饰功能从类中移除，有效的把类的核心职责和装饰功能区分开，可以去除相关类中重复的装饰逻辑。**

### 10.外观模式（Facade Pattern）

首先，在设计初期，应有意识的进行分层，比如经典的三层架构：数据访问层、业务逻辑层、表示层。**层与层之间可以建立外观Facade，提供简单的接口的供层与层之间访问，降低耦合**。

其次，在开发阶段，也会因为不断加需重构等演化而变得越加复杂，给外部使用调用变得复杂，**可以增加外观Facade，重新提供简单接口供他人调用**。

第三，维护遗留大型项目，非常难维护，删不敢删，重构又没足够时间和魄力，此时可以使用外观模式，**即再增加一个Facade类，将遗留代码封装成一个简单接口，让遗留代码与Facade对象交互，Facade与新的需求代码交互**。

### 12.代理模式（Proxy Pattern）

**代理模式，实质是为其他对象提供一种代理以控制对这个对象的访问。**

代理模式4个适用场合：

- **远程代理**。为一个对象在不同的地址空间提供局部代表。这样可以隐藏一个对象存在于不同地址空间的事实。
- **虚拟代理**。根据需要创建开销很大的对象，通过它来存放实例化需要很长时间的真实对象。
- **安全代理**。用来控制真实对象访问时的权限。
- **智能指引**。当调用真实的对象时，代理处理另外一些事。

**Objective-C 有更直接的代理Delegate，或者叫委托**

### 13.责任链模式（Chain of Responsibility Pattern）

例如：员工请假过程如下

- 员工请假申请
- 部门经理审批，若天数 > 2天，需继续向上级审批
- 部门总监审批，若天数 > 5天，需继续向上级审批
- 总经理审批

每级管理者都有自己的责任权限，超过自身责任权限，责任向下响应，此为责任链。

**本质上是条件分支（if..else..）逻辑处理。**


### 16.迭代器模式（Iterator Pattern）

像NSArray的`enumerateObjectsUsingBlock`，`for-in`等都是迭代器模式，因为太经典，几乎所有语言开发平台都会封装好。

**本质是用ZZIterator去实现ZZMutableArray的几个基本方法：**

```
- (id)firstObject;
- (id)nextObject;
- (id)currentObject;
- (BOOL)isDone;
```
**进而通过while（id object = [ZZIterator nextObject] ！= nil）的循环遍历所有item，最终实现数组集合的迭代。**

+ **ZZMutableArray** 线程安全的可变数组。
	- **ZZIteratorQueue** 创建唯一并发队列，数组操作和读取都在同一队列执行，从而保证线程安全。
	- **dispatch_sync** 同步读取。
	- **dispatch_barrier_sync** 和 **dispatch_barrier_async**
		+ **dispatch_barrier_async** 先执行 barrier 前面的任务，再执行 barrier 中的任务，最后执行 barrier 后面的任务，也就是任务按序执行；
		+ **dispatch_barrier_async** 先添加 barrier 前面的任务，再添加 barrier 中的任务，最后添加 barrier 后面的任务，也就是任务按序添加，只添加不执行，执行顺序不一定是按序执行；
	- **CFMutableArrayRef** 利用C数组进行增删改查等操作的封装。需要实现NSArray的诸多方法：
	
```
- (void)addObject:(ObjectType)anObject;
- (void)insertObject:(ObjectType)anObject atIndex:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject;
- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCapacity:(NSUInteger)numItems NS_DESIGNATED_INITIALIZER;
```
+ 遍历数组：`- (void)iteratorObjectsWithOptions:UsingBlock:`，正序、逆序遍历选项 **ZZIteratorOptions**

```
typedef NS_OPTIONS(NSUInteger, ZZIteratorOptions) 
{
    ZZIteratorOptionsConcurrent = (1UL << 0),
    ZZIteratorOptionsReverse = (1UL << 1),
};
```

### 20.状态模式（State Pattern）

有点类似于**责任链模式**，适用于多种状态逻辑处理，目的是**消除庞大的条件分支语句**

+ 首先抽象出一个对象，对象中生成几个属性和方法：
	- status（property）
	- condition（property）
	- `- (void)dosomework`（method）
+ 生成一个对象status，以及生成多个继承自status的条件分支子类，所有的子类都实现一个方法：
	- `- (void)dosomework:(Status)status`
	- 各自维护该方法及状态转化

### 22.模板方法模式（Template Method Pattern）

模板方法模式，**其实就是抽象出一个模板类，定义并实现一个模板方法，且该方法是具体的具有顶级逻辑的骨架，而其中涉及的一些变量和方法，是需要推迟到子类中去实现，从而使得顶级逻辑的实现各不相同。**

简单可以理解为：**模板方法模式，是通过把不变行为搬到父类，去除子类中的重复代码，从而体现其优势。**


## 附录 参考文献

- 《大话设计模式》作者：程杰，清华大学出版社