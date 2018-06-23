//
//  ViewController.m
//  ZMJSchedule
//
//  Created by Jason on 2018/2/6.
//  Copyright © 2018年 keshiim. All rights reserved.
//

#import "PageStataicsController.h"
#import "ZMJCells.h"

@interface PageStataicsController () <SpreadsheetViewDelegate, SpreadsheetViewDataSource>
@property (nonatomic, strong) SpreadsheetView *spreadsheetView;
@property (nonatomic, strong) NSArray<NSString *> *days;
@property (nonatomic, strong) NSArray<UIColor *>  *dayColors;
@property (nonatomic, strong) NSMutableArray<NSString *> *hours;
@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *data;

@property (nonatomic, strong) UIColor *evenRowColor; //偶数
@property (nonatomic, strong) UIColor *oddRowColor;  //奇数
@end

@implementation PageStataicsController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupMembers];
    [self setupviews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.spreadsheetView flashScrollIndicators];
}

- (void)setupMembers {
    
    self.days  = @[@"访问页面",
                   @"访问次数",
                   @"访问次数占比",
                   @"次均停留时间",
                   @"停留时间占比",
                   @"退出率",
                   @"入口页次数",
                   @"退出页次数"];
    self.dayColors = @[ [UIColor colorWithRed:0.918 green:0.224 blue:0.153 alpha:1],
                        [UIColor colorWithRed:0.106 green:0.541 blue:0.827 alpha:1],
                        [UIColor colorWithRed:0.200 green:0.620 blue:0.565 alpha:1],
                        [UIColor colorWithRed:0.953 green:0.498 blue:0.098 alpha:1],
                        [UIColor colorWithRed:0.400 green:0.584 blue:0.141 alpha:1],
                        [UIColor colorWithRed:0.835 green:0.655 blue:0.051 alpha:1],
                        [UIColor colorWithRed:0.153 green:0.569 blue:0.835 alpha:1],
                        [UIColor colorWithRed:0.918 green:0.224 blue:0.153 alpha:1]];
    
    self.evenRowColor = [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1];
    self.oddRowColor  = [UIColor whiteColor];
    self.data = @[
                  @[@"home", @"667", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"search_home", @"667", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"app", @"484", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"unit_detail", @"667", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                 @[@"chat_detail", @"368", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"search_suggestion", @"117", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"landlord_unit_publish", @"110", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"landlord_unit_publish_list", @"99", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"landlord_mystuff", @"86", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"mystuff", @"81", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"favorites", @"21", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"collect", @"21", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"home", @"667", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"search_home", @"667", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"app", @"484", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"unit_detail", @"667", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"chat_detail", @"368", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"search_suggestion", @"117", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"landlord_unit_publish", @"110", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"landlord_unit_publish_list", @"99", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"landlord_mystuff", @"86", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"mystuff", @"81", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"favorites", @"21", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"],
                  @[@"collect", @"21", @"31.94%", @"0:00:16", @"17.15%", @"20.24%", @"42", @"135"]
                  ];
    self.hours = [NSMutableArray arrayWithCapacity:self.data.count];
    for (NSInteger index = 0; index < self.data.count; index++) {
        [self.hours addObject:[NSString stringWithFormat:@"%@",@(index)]];
        
    }
}

- (void)setupviews {
    
    self.spreadsheetView.contentInset = UIEdgeInsetsMake(4, 0, 4, 0);
    
    self.spreadsheetView.intercellSpacing = CGSizeMake(4, 1);
    self.spreadsheetView.gridStyle = [GridStyle borderStyleNone];
    
    [self.spreadsheetView registerClass:[DateCell class]     forCellWithReuseIdentifier:NSStringFromClass([DateCell class])];
    [self.spreadsheetView registerClass:[TimeTitleCell class]forCellWithReuseIdentifier:NSStringFromClass([TimeTitleCell class])];
    [self.spreadsheetView registerClass:[TimeCell class]     forCellWithReuseIdentifier:NSStringFromClass([TimeCell class])];
    [self.spreadsheetView registerClass:[DayTitleCell class] forCellWithReuseIdentifier:NSStringFromClass([DayTitleCell class])];
    [self.spreadsheetView registerClass:[ScheduleCell class] forCellWithReuseIdentifier:NSStringFromClass([ScheduleCell class])];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    if (@available(iOS 11.0, *)) {
        self.spreadsheetView.frame = self.view.safeAreaLayoutGuide.layoutFrame;
    } else {
        //Fallback on earlier version
        self.spreadsheetView.frame = self.view.bounds;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: DataSource
- (NSInteger)numberOfColumns:(SpreadsheetView *)spreadsheetView {
    return 1+self.days.count;
}

- (NSInteger)numberOfRows:(SpreadsheetView *)spreadsheetView {
    return 1 + self.hours.count;
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView widthForColumn:(NSInteger)column {
    if (0 == column) {
        return 70.f;
    } else {
        return 120.f;
    }
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView heightForRow:(NSInteger)row {
    if (0 == row) {
        return 32;
    } else {
        return 40;
    }
}

- (NSInteger)frozenColumns:(SpreadsheetView *)spreadsheetView {
    return 1;
}

- (NSInteger)frozenRows:(SpreadsheetView *)spreadsheetView {
    return 1;
}

- (ZMJCell *)spreadsheetView:(SpreadsheetView *)spreadsheetView cellForItemAt:(NSIndexPath *)indexPath {
    if ((indexPath.column >= 1 && indexPath.row <= self.days.count) &&
        (indexPath.row    == 0))
    {
        DayTitleCell *cell = (DayTitleCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DayTitleCell class])
                                                                                        forIndexPath:indexPath];
        cell.label.text      = self.days[indexPath.column - 1];
        cell.label.textColor = self.dayColors[indexPath.column - 1];
        return cell;
    }  else if ((indexPath.column == 0) &&
               (indexPath.row    >= 1 && indexPath.row <= self.hours.count))
    {
        TimeCell *cell = (TimeCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TimeCell class])
                                                                                forIndexPath:indexPath];
        cell.label.text      = self.hours[indexPath.row - 1];
        cell.backgroundColor = indexPath.row % 2 == 0 ? self.evenRowColor : self.oddRowColor;
        return cell;
    } else if ((indexPath.column >= 1 && indexPath.column <= self.days.count ) &&
               (indexPath.row    >= 1 && indexPath.row <= self.hours.count ))
    {
        ScheduleCell *cell = (ScheduleCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ScheduleCell class])
                                                                                        forIndexPath:indexPath];
        NSString *text = self.data[indexPath.row - 1][indexPath.column - 1];
        if (text && text.length != 0) {
            cell.label.text = text;
            UIColor *color  = self.dayColors[indexPath.column - 1];
            cell.label.textColor = color;
            cell.color           = [color colorWithAlphaComponent:.2];
            cell.borders.top     = [[BorderStyle alloc] initWithStyle:BorderStyle_solid width:2 color:color];
            cell.borders.bottom  = [[BorderStyle alloc] initWithStyle:BorderStyle_solid width:2 color:color];
        } else {
            cell.label.text     = nil;
            cell.color          = indexPath.row % 2 == 0 ? self.evenRowColor : self.oddRowColor;
            cell.borders.top    = [BorderStyle borderStyleNone];
            cell.borders.bottom = [BorderStyle borderStyleNone];
        }
        return cell;
    }
    return nil;
}

// MARK: Delegate
- (void)spreadsheetView:(SpreadsheetView *)spreadsheetView didSelectItemAt:(NSIndexPath *)indexPath {
    NSLog(@"Selected: (Row: %ld, Column: %ld", (long)indexPath.row, (long)indexPath.column);
}

#pragma mark - lazy
- (SpreadsheetView *)spreadsheetView {
    if (!_spreadsheetView) {
        _spreadsheetView = [SpreadsheetView new];
        _spreadsheetView.delegate   = self;
        _spreadsheetView.dataSource = self;
        _spreadsheetView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_spreadsheetView];
    }
    return _spreadsheetView;
}

@end
