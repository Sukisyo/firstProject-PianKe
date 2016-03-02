//
//  PKReadDetailReadTableView.m
//  iOS片刻
//
//  Created by ma c on 16/1/23.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKReadDetailReadTableView.h"
#import "PKReadDetailReadTableViewCell.h"

static NSString *identifier = @"readTableViewCell";
@interface PKReadDetailReadTableView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PKReadDetailReadTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[PKReadDetailReadTableViewCell class] forCellReuseIdentifier:identifier];
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellmodels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PKReadDetailReadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.model = self.cellmodels[indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [self.cellHeights[indexPath.row] floatValue];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PKReadDetailReadList *list = self.cellmodels[indexPath.row];
    if ([self.articleDelegate respondsToSelector:@selector(pushToArticleVCWithContentid:)]) {
        [self.articleDelegate pushToArticleVCWithContentid:list.idField];
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
