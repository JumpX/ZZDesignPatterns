//
//  ZZWebSiteFactory.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/18.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZWebSiteFactory.h"
#import "ZZHashTable.h"

@interface ZZWebSiteFactory ()

@property (nonatomic, strong) ZZHashTable *hashTable;

@end

@implementation ZZWebSiteFactory

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hashTable = [ZZHashTable createHashTable];
    }
    return self;
}

- (ZZFlyweightWebSite *)webSiteWithKey:(NSString *)key
{
    if (!key || key.length == 0) return nil;
    
    ZZHashKey *hashKey = [ZZHashKey createHashKey:key];
    if ([self.hashTable getHashNode:hashKey]) {
        return (ZZFlyweightWebSite *)[self.hashTable getHashNode:hashKey].value;
    } else {
        ZZFlyweightWebSite *webSite = [ZZFlyweightWebSite webSiteWithName:key];
        ZZHashNode *hashNode = [ZZHashNode createHashNode:hashKey value:webSite];
        [self.hashTable addHashNode:hashNode];
        return webSite;
    }
}

- (void)removeAllWebSite
{
    [self.hashTable removeAllHashNodes];
}

- (NSInteger)webSiteCount
{
    return self.hashTable.count;
}

@end
