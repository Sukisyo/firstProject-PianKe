//
//  PKHomeTodayTableView.h
//  iOS片刻
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKBaseTableView.h"

@protocol PKHomeTodayTableViewRefreshDelegate <NSObject>

- (void)reloadData;
- (void)loadMoreData;
- (void)hideBackView;
- (void)presentBackView;

@end

@interface PKHomeTodayTableView : PKBaseTableView

@property (nonatomic,strong) NSArray *cellModels;
@property (nonatomic,strong) NSArray *cellHeights;

@property (nonatomic,weak) id<PKHomeTodayTableViewRefreshDelegate> refreshDelegate;

@end
