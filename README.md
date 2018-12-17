# ZZDesignPatterns


## 23种设计模式中英文

| Number | 模式 | Pattern | 类型 |
|:---:|:-------:|:--------:|:-----:|
|1.|工厂方法模式|Factory Method Pattern|创建型|
|2.|抽象工厂模式|Abstract Factory Pattern|创建型|
|3.|建造者模式|Builder Pattern|创建型|
|4.|原型模式|Prototype Pattern|创建型|
|5.|单例模式|Singleton Pattern|创建型|
|6.|适配器模式|Adapter Pattern|结构型|
|7.|桥接模式|Bridge Pattern|结构型|
|8.|组合模式|Composite Pattern|结构型|
|9.|装饰模式|Decorator Pattern|结构型|
|10.|外观模式|Facade Pattern|结构型|
|11.|享元模式|Flyweight Pattern|结构型|
|12.|代理模式|Proxy pattern|结构型|
|13.|责任链模式|Chain of Responsibility Pattern|行为型|
|14.|命令模式|Command Pattern|行为型|
|15.|解释器模式|Interpreter Pattern|行为型|
|16.|迭代器模式|Iterator Pattern|行为型|
|17.|中介者模式|Mediator Pattern|行为型|
|18.|备忘录模式|Memento Pattern|行为型|
|19.|观察者模式|Observer Pattern|行为型|
|20.|状态模式|State Pattern|行为型|
|21.|策略模式|Strategy Pattern|行为型|
|22.|模板方法模式|Template Method Pattern|行为型|
|23.|访问者模式|Visitor Pattern|行为型|

## 概念：类和接口

- 类是对对象的抽象
- 抽象类是对类的抽象
- 接口是对行为的抽象

## 六个大原则

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

开放-封闭原则是面向对象设计的核心所在。我们应该对程序中呈现出频繁变化的那些部分做出抽离，但不应该把程序中的每个部分都刻意进行抽象。

抽象很重要，拒绝不成熟的抽象更重要！

#### 原则三：依赖倒转原则

依赖倒转原则：

- A.高层模板不应该依赖底层模块。两个都应该依赖抽象。
- B.抽象不应该依赖细节，细节应该依赖于抽象。

简单点说，就是要针对接口编程，不要对实现编程。

#### 原则四：里氏代换原则

里氏代换原则：

- 子类型必须能够替换掉它们的父类型。

换句话说，一个软件实体如果使用的是一个父类的话，那么一定适用于其子类，而且它觉察不出父类对象和子类对象的区别。也就是说，在软件里面，把父类都替换成它的子类，程序的行为没有变化。也正因为有了这个原则，使得继承、复用、扩展成为了可能。

#### 原则五：迪米特法则

迪米特法则，也叫最少知识原则：

- 如果两个类不必彼此直接通信，那么这两个类就不应当发生直接的相互作用。如果其中一个类需要调用另一个类的某一个方法的话，可以通过第三者转发这个调用。

迪米特法则首先强调的前提是在类的结构设计上，每一个类都应当尽量降低成员的访问权限，也就是说，一个类包装好自己的private状态，不需要让别的类知道的字段或行为就不要公开。

根本思想是，强调类之间的松耦合。

#### 原则六：合成/聚合复用原则

合成/聚合复用原则：

- 尽量使用合成/聚合
- 尽量不要使用类继承

合成（或组合）和聚合都是关联的特殊种类。聚合表示 一种弱的“拥有”关系，体现的是A对象可以包含B对象，但B不是A的一部分；合成则是一种强的“拥有”关系，体现了严格的部分和整体的关系，部分和整体的生命周期一样。

## 介绍各种模式

### 1.工厂方法（Factory Method Pattern）

工厂方法模式：定义一个用于创建对象的接口，让子类决定实例化哪一个类。工厂方法使一个类的实例延迟到其子类。

另外与工厂方法模式相似的还有简单工厂模式。但选择判断的问题都存在。

简单工厂模式：

- 判断逻辑在工厂类。
- 优点在于工厂类中包含了必要的逻辑判断，根据选择条件动态实例化相关的类，不必依赖于具体的产品。
- 缺点是违背了开放-封闭原则，若新增功能就得在工厂类增加新的判断分支。


工厂方法模式：

- 判断逻辑在调用时。
- 优点在于根据具体的产品去调用对应工厂类实例化相关的类，若新增功能只需修改调用处。
- 缺点也在于要依据具体的产品，没有简单工厂模式灵活。

### 2.抽象工厂模式（Abstract Factory Pattern）

抽象工厂模式：提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类。

抽象工厂模式基于工厂方法模式，优点是：

- 最大的好处是便于交换产品系列，由于具体工厂类在一个应用中需要在初始化的时候出现一次，这就使得改变一个应用的具体工厂变得非常容易，它只需要改变具体工厂即可使用不同的产品配置。
- 第二大好处是，它让具体的创建实例过程与使用代码分离，产品具体类名也被具体工厂实现分离，不会出现在调用代码中。

缺点是：

- 每增加一种产品，就得新增多个对应类，同时还得更改多个对应的工厂类才能实现，显得很呆板丑陋。

针对缺点，可以结合简单工厂来改进。在工厂类中增加判断分支，会灵活点。

### 3.建造者模式（Builder Pattern）

建造者模式：将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示。

用户只需指定需要建造的类型就可以得到它们，而具体建造的过程和细节就不需知道了。

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

单例模式：保证一个类仅有一个实例，并提供一个访问它的全局访问点。

通常我们可以让一个全局变量使得一个对象被访问，但它不能防止你实例化多个对象。一个最好的办法就是，让类自身负责保护自己的唯一实例。这个类要保证没有其它实例会被创建，并且还要提供一个访问该实例的方法。

+ 实现方式主要分2种：

```
// 方式一：@synchronized （@synchronized 同步锁确保线程临界区时，只执行一次。已过时）
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
// 方式二：dispatch_once_t （只执行一次，苹果推荐的方式）
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

+ 有三种方式，用于避免instance被new、init、copy、mutableCopy等方法重新创建实例，保证它是唯一实例。

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

适配器模式：将一个类的接口转换成客户希望的另外一个接口。使得原来由于接口不兼容而不能一起工作的那些类可以一起工作。

当两个类具有相同作用和方法，但因为历史原因，方法名不一致，此时需要用适配器将特殊类的方法用普通类去实现。

代码中实现了两个简单的例子：

- ZZAdapterSimpleSample
- ZZAdapterPlayer

### 7.桥接模式（Bridge Pattern）

桥接模式：将抽象部分与它的实现部分分离，使它们都可以独立的变化。

实现指的是抽象类和它的派生类用来实现自己的对象。实现系统可能有多角度分类，每一种分类都有可能变化，那么就把这种多角度分离出来让它们独立变化，减少它们之间的耦合。

### 8.组合模式（Composite Pattern）

组合模式：将对象组合成树形结构以表示“部分-整体”的层次结构。组合模式使得用户对单个对象和组合对象的使用具有一致性。

组合模板类似于数据结构中的树，每个组合就类似于节点，没有组合子类的就是叶子。实现二叉树时可以考虑用组合模式。

组合模板分透明方式和安全方式：

- 透明方式：所有的子类都具备相同的方法和属性，也就是对外界而言，叶节点和枝节点没有区别。问题很明显，就是叶节点不具备Add和Remove方法，实现它们是没有意义的。
- 安全方式：就是在父类中不去声明Add和Remove方法，子类的叶节点就不需要去实现它们，只在枝节点申明和实现它们。问题也很明显，调用时需要判断枝节点或叶节点，不够方便。

### 9.装饰模式（Decorator Pattern）

装饰模式：动态的给一个对象添加一些额外额职责，就增加功能而言，装饰模式比生成子类更为灵活。

装饰模式和建造者模式很相像，**区别在于建造者有个指挥者，按照给定的功能或者固定的顺序进行稳定的建造；而装饰模式不需要指挥者，可以给对象相对灵活的装饰。**

每个装饰对象只关心自己的功能，不关心如何被添加到对象链当中。

适用场合：

- **简化类。把类中的装饰功能从类中移除，有效的把类的核心职责和装饰功能区分开，可以去除相关类中重复的装饰逻辑。**

### 10.外观模式（Facade Pattern）

外观模式：为子系统中的一组接口提供一个一致的界面，此模式定义了一个高层接口，这个接口使得这一子系统更加容易使用。

首先，在设计初期，应有意识的进行分层，比如经典的三层架构：数据访问层、业务逻辑层、表示层。**层与层之间可以建立外观Facade，提供简单的接口的供层与层之间访问，降低耦合**。

其次，在开发阶段，也会因为不断加需重构等演化而变得越加复杂，给外部使用调用变得复杂，**可以增加外观Facade，重新提供简单接口供他人调用**。

第三，维护遗留大型项目，非常难维护，删不敢删，重构又没足够时间和魄力，此时可以使用外观模式，**即再增加一个Facade类，将遗留代码封装成一个简单接口，让遗留代码与Facade对象交互，Facade与新的需求代码交互**。

### 12.代理模式（Proxy Pattern）

代理模式：为其他对象提供一种代理以控制对这个对象的访问。

代理模式4个适用场合：

- 远程代理。为一个对象在不同的地址空间提供局部代表。这样可以隐藏一个对象存在于不同地址空间的事实。
- 虚拟代理。根据需要创建开销很大的对象，通过它来存放实例化需要很长时间的真实对象。
- 安全代理。用来控制真实对象访问时的权限。
- 智能指引。当调用真实的对象时，代理处理另外一些事。

**Objective-C 有更直接的代理Delegate，或者叫委托**

### 13.责任链模式（Chain of Responsibility Pattern）

职责链模式：使多个对象都有机会处理请求，从而避免请求的发送者和接收者之间的耦合关系。将这个对象连成一条链，并沿着这条链传递该请求，直到有一个对象处理它为止。

例如：员工请假过程如下

- 员工请假申请
- 部门经理审批，若天数 > 2天，需继续向上级审批
- 部门总监审批，若天数 > 5天，需继续向上级审批
- 总经理审批

每级管理者都有自己的责任权限，超过自身责任权限，责任向下响应，此为责任链。

本质上还是条件分支（if..else..）逻辑处理。

### 15.解释器模式（Interpreter Pattern）

解释器模式：给定一个语言，定义它的文法的一种表示，并定义一个解释器，这个解释器使用该表示来解释语言中的句子。

比如正则表达式匹配字符串、IE浏览器解释HTML、Objective-C等编程语言，都可以看成是复杂的解释器模式。

### 16.迭代器模式（Iterator Pattern）

迭代器模式：提供一种方法顺序访问一个聚合对象中各个元素，而又不暴露该对象的内部表示。

迭代器模式就是分离了集合对象的遍历行为，抽象出一个迭代器类来负责，这样既做到不暴露集合的内部结构，又可以让外部代码透明的访问集合内部的数据。

当你需要对集合有多种方式遍历时，可以考虑用迭代器模式。一般需要提供几个接口：开始项，当前项，下一项，是否结束等。

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

### 17.中介者模式（Mediator Pattern）

中介者模式：用一个中介对象来封装一系列的对象交互。中介者使各对象不需要显示的相互引用，从而使其耦合松散，而且可以独立的改变它们之间的交互。

其实中介者模式，只是把交互复杂性转成了中介者的复杂性。但优点是集中控制，缺点也是集中控制。

中介者模式也很常用，比如Objective-C中的View，View中一般会含有多个文本、按钮或其他控件，每个控件都是通过View来交互。

### 18.备忘录模式（Memento Pattern）

备忘录模式：在不破坏封装性的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。这样以后就可将该对象恢复到原先保存的状态。

备忘录模式比较适合功能比较复杂的，但需要维护或记录属性历史的类，或者需要保存的属性只是众多属性中的一小部分时，可以保存部分信息还原到前一状态。

### 19.观察者模式（Observer Pattern）

观察者模式：定义了一种一对多的依赖关系，让多个观察者对象同时监听某一个主题对象。这个主题对象在状态发生变化时，会通过所有观察者对象，使它们能够自动更新自己。

**苹果封装通知中心：NSNotificationCenter，根据原理，实现源码
ZZNotificationCenter，具体代码在ZZNotification中。**

### 20.状态模式（State Pattern）

状态模式：当一个对象的内在状态改变时允许改变其行为，这个对象看起来像是改变了其类。

有点类似于**责任链模式**，适用于多种状态逻辑处理，主要解决的是当控制一个对象状态转换的条件表达式过于复杂时的情况。把状态的判断逻辑转移到表示不同的一系列类当中，可以把复杂的判断逻辑简化，消除庞大的条件分支语句。

实现逻辑大致如下：

+ 抽象出一个对象，对象中生成几个属性和方法：
	- status（property）
	- condition（property）
	- `- (void)dosomework`（method）
+ 生成一个对象status，以及生成多个继承自status的条件分支子类，所有的子类都实现一个方法：
	- `- (void)dosomework:(Status)status`
	- 各自维护该方法及状态转化

### 22.模板方法模式（Template Method Pattern）

模板方法模式：定义一个操作中的算法的骨架，而将一些步骤延迟到子类中。模板方法使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。

模板方法模式，**其实就是抽象出一个模板类，定义并实现一个模板方法，且该方法是具体的具有顶级逻辑的骨架，而其中涉及的一些变量和方法，是需要推迟到子类中去实现，从而使得顶级逻辑的实现各不相同。**

简单可以理解为：**模板方法模式，是通过把不变行为搬到父类，去除子类中的重复代码，从而体现其优势。**

### 23.访问者模式（Visitor Pattern）

访问者模式：表示一个作用于某对象结构中的各元素的操作。它使你可以在不改变各元素的类的前提下定义作用于这些元素的新操作。

优点是适用于数据结构比较稳定，增加新的操作（新的访问者）就会很容易。
缺点是数据结构改变或增加新的数据结构就会变得困难。

例如：显示人（只有男人、女人，数据结构稳定，想要增加太监、人妖等就比较困难）的状态（比如成功、失败，恋爱等等，增加新的状态会很容易）。

```
// 人的状态
[man acceptVisitor:success];
[man acceptVisitor:fail];
[man acceptVisitor:love];
...// 男人增加状态（访问者）
[woman acceptVisitor:success];
[woman acceptVisitor:fail];
[woman acceptVisitor:love];
...// 女人增加状态（访问者）
```

## 附录 参考文献

- 《大话设计模式》作者：程杰，清华大学出版社