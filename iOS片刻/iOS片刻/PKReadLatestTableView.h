//
//  PKReadLatestTableView.h
//  iOS片刻
//
//  Created by ma c on 16/1/24.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PKReadLatestTableViewDelegate <NSObject>

- (void)pushToArticleVCWithContentid:(NSString *)contentid;

@end

@interface PKReadLatestTableView : UITableView

@property (nonatomic,strong) NSArray *cellModels;
@property (nonatomic,strong) NSArray *cellHeights;
@property (nonatomic,strong) id<PKReadLatestTableViewDelegate> articleDelegate;

@end
