//
//  PKGoodProductDetailPostView.h
//  iOS片刻
//
//  Created by ma c on 16/1/21.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKGoodProductDetailPostsinfo.h"

@interface PKGoodProductDetailPostView : UIView

@property (nonatomic,strong) UIButton *groupButton;
@property (nonatomic,strong) UIButton *moreGroupButton;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *iconButton;
@property (nonatomic,strong) UILabel *unameLabel;
@property (nonatomic,strong) UILabel *addtimeLabel;


@property (nonatomic,strong) PKGoodProductDetailPostsinfo *model;

@end
