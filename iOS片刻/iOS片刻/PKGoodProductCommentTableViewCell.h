//
//  PKGoodProductCommentTableViewCell.h
//  iOS片刻
//
//  Created by ma c on 16/1/22.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKGoodProductDetailCommentlist.h"

@interface PKGoodProductCommentTableViewCell : UITableViewCell

@property (nonatomic,strong) PKGoodProductDetailCommentlist *model;
@property (nonatomic,strong) NSDictionary *heightDic;

@end
