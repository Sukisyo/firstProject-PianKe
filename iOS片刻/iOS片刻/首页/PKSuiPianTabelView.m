//
//  PKSuiPianTabelView.m
//  iOS片刻
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKSuiPianTabelView.h"
#import "PKSuiPianTabelViewCell.h"
#import "PKSuiPianCellFrameModel.h"


static NSString *identifier = @"suiPianCell";
@interface PKSuiPianTabelView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PKSuiPianTabelView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        
        [self registerClass:[PKSuiPianTabelViewCell class] forCellReuseIdentifier:identifier];
        self.delegate = self;
        self.dataSource = self;
        
        
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PKSuiPianTabelViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    PKSuiPianCellFrameModel *frameModel = self.tableSource[indexPath.row];
    cell.frameModel = frameModel;
    
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

        return [self.tableSource[indexPath.row] height];

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.detailDelegate pushToDetailPageWithContentid:[self.tableSource[indexPath.row] suiPianList].contentid];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
