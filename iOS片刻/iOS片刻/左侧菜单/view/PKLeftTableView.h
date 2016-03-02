//
//  PKLeftTableView.h
//  iOS片刻
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PKLeftTableViewSelectRow <NSObject>

- (void)selectWhichRow:(NSInteger)row;

@end

@interface PKLeftTableView : UITableView

@property (nonatomic,strong) NSArray *tabelViewSource;
@property (nonatomic,weak) id<PKLeftTableViewSelectRow> rowDelegate;

@end
