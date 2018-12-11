# ZZDesignPatterns
-

+ **23种设计模式中英文**

| Number | 模式 | Pattern |
|:------:|:---:|:-------:|
|1.|工厂方法模式|Factory Method Pattern|
|2.|抽象工厂模式|Abstract Factory Pattern|
|3.|建造者模式|Builder Pattern|
|4.|原型模式|Prototype Pattern|
|5.|单例模式|Singleton Pattern|
|6.|适配器模式|Adapter Pattern|
|7.|桥梁模式/桥接模式|Bridge Pattern|
|8.|组合模式|Composite Pattern|
|9.|装饰模式|Decorator Pattern|
|10.|门面模式/外观模式|Facade Pattern|
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

### 5.单例模式

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

### 6.适配器模式

适配器是当两个类具有相同作用和方法，但因为历史原因，方法名不一致，此时需要用适配器将特殊类的方法用普通类去实现。

**本质上是新建一个继承自普通类的子类，用该子类将特殊类包一层，在对应的普通方法中去调用特殊类的对应的特殊方法。**

两个简单的例子：

- ZZAdapterSimpleSample
- ZZAdapterPlayer

### 13.责任链模式

例如：员工请假过程如下

- 员工请假申请
- 部门经理审批，若天数 > 2天，需继续向上级审批
- 部门总监审批，若天数 > 5天，需继续向上级审批
- 总经理审批

每级管理者都有自己的责任权限，超过自身责任权限，责任向下响应，此为责任链。

**本质上是条件分支（if..else..）逻辑处理。**


### 16.迭代器模式

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

