//
//  PKSuiPianDetailCommentTableView.m
//  iOS片刻
//
//  Created by ma c on 16/1/25.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKSuiPianDetailCommentTableView.h"
#import "PKSuiPianDetailCommentTableViewCell.h"

static NSString *identifier = @"suipiancommentcell";
@interface PKSuiPianDetailCommentTableView ()<UITableViewDataSource,UITableViewDelegate>



@end

@implementation PKSuiPianDetailCommentTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        
        [self setBackgroundColor:RGB(251, 251, 251)];
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[PKSuiPianDetailCommentTableViewCell class] forCellReuseIdentifier:identifier];
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellModels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PKSuiPianDetailCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.model = self.cellModels[indexPath.row];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellHeights[indexPath.row] floatValue];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
