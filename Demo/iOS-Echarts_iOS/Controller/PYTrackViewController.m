//
//  PYTrackViewController.m
//  TJBehaviourAnalysis
//
//  Created by dong on 2018/6/23.
//  Copyright © 2018年 pluto-y. All rights reserved.
//

#import "PYTrackViewController.h"
#import "BHDataRequest.h"
@interface PYTrackViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tabView;

@end

@implementation PYTrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tabView];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}



- (UITableView *)tabView{
    if (!_tabView) {
        _tabView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tabView.delegate = self;
        _tabView.dataSource = self;
    }
    return _tabView;
}


@end
