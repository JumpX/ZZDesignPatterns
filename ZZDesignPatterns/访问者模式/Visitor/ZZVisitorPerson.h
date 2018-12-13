//
//  ZZVisitorPerson.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/13.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZZVisitorAction;
@interface ZZVisitorPerson : NSObject

@property (nonatomic, copy) NSString *name;

- (void)acceptVisitor:(ZZVisitorAction *)visitor;

@end
