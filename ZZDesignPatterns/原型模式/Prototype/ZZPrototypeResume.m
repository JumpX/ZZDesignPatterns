//
//  ZZPrototypeResume.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZPrototypeResume.h"

@interface ZZPrototypeResume ()

@property (nonatomic, copy)     NSString                *name;
@property (nonatomic, copy)     NSString                *age;
@property (nonatomic, copy)     NSString                *sex;
@property (nonatomic, strong)   ZZPrototypeWorkHistory  *work;

@end

@implementation ZZPrototypeResume

- (void)setResumeName:(NSString *)name
{
    self.name = name;
//    self.work = [ZZPrototypeWorkHistory new];
}

- (void)setResumeInfoWithAge:(NSString *)age sex:(NSString *)sex
{
    self.age = age;
    self.sex = sex;
}

- (void)setResumeWorkWithCompany:(NSString *)company date:(NSString *)date
{
    self.work.company = company;
    self.work.workDate = date;
}

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

- (ZZPrototypeWorkHistory *)work
{
    if (!_work) {
        _work = [ZZPrototypeWorkHistory new];
    }
    return _work;
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> >>>> name:%@ >>>> age:%@ >>>> sex:%@ >>>> \nwork:%@", [self class], self, self.name, self.age, self.sex, [self.work debugDescription]];
}

@end
