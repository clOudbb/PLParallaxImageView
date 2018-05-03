//
//  ViewController.m
//  ImageAni
//
//  Created by qmtv on 2018/5/3.
//  Copyright © 2018年 clOud. All rights reserved.
//

#import "ViewController.h"
#import "ImageTableViewCell.h"

static NSString * const kImageTableViewCell = @"ImageTableViewCell";
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _arr = [@[] mutableCopy];
    for (int i = 0; i < 20; i++) {
        if (i % 2 == 0) [_arr addObject:@"1.jpg"];
        else [_arr addObject:@"2.jpg"];
    }
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.rowHeight = 200;
        [_tableView registerClass:[ImageTableViewCell class] forCellReuseIdentifier:kImageTableViewCell];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kImageTableViewCell];
    cell.imgView.image = [UIImage imageNamed:_arr[indexPath.row]];
    cell.tableView = _tableView;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    for (ImageTableViewCell *cell in _tableView.visibleCells) {
        [cell.imgView viewDidScroll];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
