//
//  DHHomeViewController.m
//  SimpleCode
//
//  Created by 江道洪 on 2016/12/10.
//  Copyright © 2016年 江道洪. All rights reserved.
//

#import "DHHomeViewController.h"

@interface DHHomeViewController ()

@property (nonnull, nonatomic, strong, readwrite) NSMutableArray *titles;
@property (nonnull, nonatomic, strong, readwrite) NSMutableArray *vcClassNames;

@end

@implementation DHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataSource];
    [self setupUI];
}

#pragma mark - data source

- (void)initDataSource {
    _titles = [NSMutableArray array];
    _vcClassNames = [NSMutableArray array];
}

#pragma mark - UI

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addCellName:@"first" pushToVC:@"DHHomeViewController"];
}

- (void)addCellName:(NSString *)name pushToVC:(NSString *)vcClassName
{
    [_titles addObject:name];
    [_vcClassNames addObject:vcClassName];
}

#pragma mark - table view delegate & data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_titles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = _vcClassNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *vc = [class new];
        vc.title = _titles[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
