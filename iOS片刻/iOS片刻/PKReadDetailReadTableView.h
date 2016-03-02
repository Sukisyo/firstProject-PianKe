//
//  PKReadDetailReadTableView.h
//  iOS片刻
//
//  Created by ma c on 16/1/23.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PKReadDetailReadTableViewDelegate <NSObject>

- (void)pushToArticleVCWithContentid:(NSString *)contentid;

@end

@interface PKReadDetailReadTableView : UITableView

@property (nonatomic,strong) NSArray *cellmodels;
@property (nonatomic,strong) NSArray *cellHeights;
@property (nonatomic,strong) id<PKReadDetailReadTableViewDelegate> articleDelegate;

@end
