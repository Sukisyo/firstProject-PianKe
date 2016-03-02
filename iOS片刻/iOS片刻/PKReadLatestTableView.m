//
//  PKReadLatestTableView.m
//  iOS片刻
//
//  Created by ma c on 16/1/24.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKReadLatestTableView.h"
#import "PKReadLatestTableViewCell.h"
#import "PKReadLatestList.h"
#import "NSString+Helper.h"

static NSString *identifier = @"readLatestCell";
@interface PKReadLatestTableView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PKReadLatestTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[PKReadLatestTableViewCell class] forCellReuseIdentifier:identifier];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellModels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PKReadLatestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    PKReadLatestList *model = self.cellModels[indexPath.row];
    cell.isImage = ![model.firstimage isEmptyString];
    cell.titleHeight = [self.cellHeights[indexPath.row] floatValue] - 120;
    cell.model = model;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self.cellHeights[indexPath.row] floatValue];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.articleDelegate respondsToSelector:@selector(pushToArticleVCWithContentid:)]) {
        [self.articleDelegate pushToArticleVCWithContentid:[self.cellModels[indexPath.row] contentid]];
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
