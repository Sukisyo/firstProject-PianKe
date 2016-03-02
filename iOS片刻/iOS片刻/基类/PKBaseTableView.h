//
//  PKBaseTableView.h
//  iOS片刻
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKBaseTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

- (void)addHeadRefreshWithAction:(SEL)headAction;
- (void)addFootRefreshWithAction:(SEL)footAction;


@end

