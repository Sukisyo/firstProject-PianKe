//
//  PKReadDetailNavigationBar.h
//  iOS片刻
//
//  Created by ma c on 16/1/23.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKReadDetailNavigationBar : UIView

@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIButton *addtimeButton;
@property (nonatomic,strong) UIButton *hotButton;
@property (nonatomic,strong) UILabel *underLine;

- (void)addtimeBtnAction:(UIButton *)sender;
- (void)hotBtnAction:(UIButton *)sender;

@end
