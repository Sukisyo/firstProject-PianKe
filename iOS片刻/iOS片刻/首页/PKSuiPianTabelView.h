//
//  PKSuiPianTabelView.h
//  iOS片刻
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SuiPianTableViewRowDelegate <NSObject>

- (void)pushToDetailPageWithContentid:(NSString *)contentid;

@end

@interface PKSuiPianTabelView : UITableView

@property (nonatomic,strong) NSArray *tableSource;
@property (nonatomic,weak) id<SuiPianTableViewRowDelegate> detailDelegate;

@end
