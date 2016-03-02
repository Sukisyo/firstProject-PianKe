//
//  PKGoodProductCommentTableView.m
//  iOS片刻
//
//  Created by ma c on 16/1/22.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKGoodProductCommentTableView.h"
#import "PKGoodProductCommentTableViewCell.h"


static NSString *identifier = @"goodProductCommentCell";

@interface PKGoodProductCommentTableView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PKGoodProductCommentTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[PKGoodProductCommentTableViewCell class] forCellReuseIdentifier:identifier];
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellModels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PKGoodProductCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.model = self.cellModels[indexPath.row];
    cell.heightDic = self.cellHeights[indexPath.row];
    
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.cellHeights[indexPath.row] valueForKey:@"cellHeight"] floatValue];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
