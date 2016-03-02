//
//  PKGoodProduct.m
//  iOS片刻
//
//  Created by ma c on 16/1/21.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKGoodProduct.h"
#import "PKGoodProductTableViewCell.h"

static NSString *identifier = @"goodProductCell";
@interface PKGoodProduct ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PKGoodProduct

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[PKGoodProductTableViewCell class] forCellReuseIdentifier:identifier];
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
    }
    
    return self;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PKGoodProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.model = self.tableSource[indexPath.row];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 212;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.pushDelegate respondsToSelector:@selector(pushToDetailVCWithContentid:)]) {
        [self.pushDelegate pushToDetailVCWithContentid:[self.tableSource[indexPath.row] contentid]];
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
