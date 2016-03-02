//
//  PKReadLatestTableViewCell.h
//  iOS片刻
//
//  Created by ma c on 16/1/24.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKReadLatestList.h"

@interface PKReadLatestTableViewCell : UITableViewCell

@property (nonatomic,strong) PKReadLatestList *model;
@property (nonatomic,assign) BOOL isImage;
@property (nonatomic,assign) CGFloat titleHeight;

@end
