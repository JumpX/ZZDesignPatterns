//
//  ZZTableViewController.m
//  ZZDesignPatterns
//
//  Created by 徐勉俊 on 2018/12/17.
//  Copyright © 2018 Jungle. All rights reserved.
//

#import "ZZTableViewController.h"
#import "ZZPatternViewController.h"
#import "ZZPatternModel.h"

@interface ZZTableViewController ()

@property (nonatomic, strong) NSArray <ZZPatternModel *>*patterns;

@end

@implementation ZZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ZZDesignPatterns";
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.patterns.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const identifier = @"ZZDesignPatternCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    ZZPatternModel *pattern = self.patterns[indexPath.row];
    cell.textLabel.text = pattern.name;
    cell.detailTextLabel.text = pattern.type;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZZPatternModel *pattern = self.patterns[indexPath.row];
    ZZPatternViewController *patternViewController = [[ZZPatternViewController alloc] initWithPattern:pattern];
    [self.navigationController pushViewController:patternViewController animated:YES];
}

#pragma mark - patterns

- (NSArray *)patterns
{
    if (!_patterns) {
        NSMutableArray *multArray = [NSMutableArray new];
        NSArray <NSDictionary *>*patterns = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DesignPatterns" ofType:@"plist"]];
        [patterns enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dic, NSUInteger idx, BOOL * _Nonnull stop) {
            ZZPatternModel *pattern = [ZZPatternModel patternWithID:[NSString stringWithFormat:@"%zd", idx+1] name:dic[@"name"] enName:dic[@"enName"] type:dic[@"type"] desc:dic[@"description"] demo:dic[@"demo"]];
            [multArray addObject:pattern];
        }];
        _patterns = [multArray copy];
    }
    return _patterns;
}

@end
