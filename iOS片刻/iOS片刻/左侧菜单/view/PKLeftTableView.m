//
//  PKLeftTableView.m
//  iOS片刻
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKLeftTableView.h"
#import "PKLeftTableViewCell.h"

#define identifier @"PKLeftTableView"
@interface PKLeftTableView ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation PKLeftTableView

//- (NSArray *)dataSource {
//
//}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        [self registerClass:[PKLeftTableViewCell class] forCellReuseIdentifier:identifier];
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self setBackgroundColor:RGB(51, 51, 51)];
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

#pragma make - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tabelViewSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PKLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.name = self.tabelViewSource[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_rowDelegate performSelector:@selector(selectWhichRow:)]) {
        [_rowDelegate selectWhichRow:indexPath.row];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
