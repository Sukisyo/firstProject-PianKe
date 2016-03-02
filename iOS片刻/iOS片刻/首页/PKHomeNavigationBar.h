//
//  PKHomeNavigationBar.h
//  iOS片刻
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKHomeNavigationBar : UIView

@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIButton *suiPianBtn;
@property (nonatomic,strong) UIButton *xianZaiBtn;
@property (nonatomic,strong) UIButton *dongTaiBtn;
@property (nonatomic,strong) UILabel *underLine;

- (void)suiPianBtnAction:(UIButton *)sender;
- (void)xianZaiBtnAction:(UIButton *)sender;
- (void)dongTaiBtnAction:(UIButton *)sender;

@end
