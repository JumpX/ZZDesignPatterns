//
//  ZZTemplateMethodAnswer.h
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/11.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZTemplateMethodAnswer : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *status;

- (void)nameAnswer;
- (void)ageAnswer;
- (void)statusAnswer;

@end
