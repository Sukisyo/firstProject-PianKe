//
//  PKBaseTableView.m
//  iOS片刻
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKBaseTableView.h"
#import "MJRefresh.h"

@interface PKBaseTableView ()

@property (nonatomic,strong) NSArray *refreshingImages;

@end

@implementation PKBaseTableView

/**
 *  refresh图片
 */
- (NSArray *)refreshingImages {
    if (!_refreshingImages) {
        NSMutableArray *marr = [NSMutableArray array];
        for (int i = 0; i <= 28; i++) {
            NSString *name = [NSString stringWithFormat:@"new_refresh%i",i];
            [marr addObject:name];
        }
        NSMutableArray *marrImages = [NSMutableArray array];
        for (NSString *str in marr) {
            UIImage *image = [UIImage imageNamed:str];
            [marrImages addObject:image];
        }
        _refreshingImages = marrImages;
    }
    return _refreshingImages;
}

- (void)addHeadRefreshWithAction:(SEL)headAction {
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:headAction];
    
    // 设置普通状态的动画图片
    [header setImages:@[[UIImage imageNamed:@"pullRefresh"]] forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:@[[UIImage imageNamed:@"loading"]] forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    
    header.stateLabel.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 设置header
    self.mj_header = header;
}

- (void)addFootRefreshWithAction:(SEL)footAction {
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:footAction];
    
    // 设置刷新图片
    [footer setImages:self.refreshingImages forState:MJRefreshStateRefreshing];
    
    footer.refreshingTitleHidden = YES;
    footer.stateLabel.hidden = YES;
    //    [footer setTitle:@"dsad" forState:MJRefreshStateNoMoreData];
    
    // 设置尾部
    self.mj_footer = footer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
