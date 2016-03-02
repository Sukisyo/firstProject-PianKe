//
//  PKHomeNavigationBar.m
//  iOS片刻
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKHomeNavigationBar.h"
#import "Masonry.h"

@interface PKHomeNavigationBar ()

@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UILabel *line1;//横向的线
@property (nonatomic,strong) UILabel *line2;//纵向的线

@end

@implementation PKHomeNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self) {
        self = [super initWithFrame:frame];
        if (self) {
            
            _topView = [[UIView alloc] init];
            [_topView setBackgroundColor:[UIColor blackColor]];
            [self addSubview:_topView];
            
            _backView = [[UIView alloc] init];
            [_backView setBackgroundColor:[UIColor whiteColor]];
            [self addSubview:_backView];
            
            _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_backButton setImage:[UIImage imageNamed:@"sidemenu"] forState:UIControlStateNormal];
            [self addSubview:_backButton];
            
            _nameLabel = [[UILabel alloc] init];
            [_nameLabel setTextColor:[UIColor blackColor]];
            [_nameLabel setFont:[UIFont systemFontOfSize:15]];
//            [_nameLabel setText:@"26/Jan."];
            [self addSubview:_nameLabel];
            
            _line1 = [[UILabel alloc] init];
            [_line1 setBackgroundColor:RGB(221, 221, 221)];
            [self addSubview:_line1];
            
            _line2 = [[UILabel alloc] init];
            [_line2 setBackgroundColor:RGB(221, 221, 221)];
            [self addSubview:_line2];
            
            _suiPianBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_suiPianBtn setBackgroundImage:[UIImage imageNamed:@"碎片_normal"] forState:UIControlStateNormal];
            [_suiPianBtn setBackgroundImage:[UIImage imageNamed:@"碎片_selected"] forState:UIControlStateSelected];
            [_suiPianBtn addTarget:self action:@selector(suiPianBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_suiPianBtn];
            
            _xianZaiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_xianZaiBtn setBackgroundImage:[UIImage imageNamed:@"现在_normal"] forState:UIControlStateNormal];
            [_xianZaiBtn setBackgroundImage:[UIImage imageNamed:@"现在_selected"] forState:UIControlStateSelected];
            [_xianZaiBtn addTarget:self action:@selector(xianZaiBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_xianZaiBtn];
            
            _dongTaiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_dongTaiBtn setBackgroundImage:[UIImage imageNamed:@"动态_normal"] forState:UIControlStateNormal];
            [_dongTaiBtn setBackgroundImage:[UIImage imageNamed:@"动态_selected"] forState:UIControlStateSelected];
            [_dongTaiBtn addTarget:self action:@selector(dongTaiBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_dongTaiBtn];
            
            _underLine = [[UILabel alloc] initWithFrame:CGRectMake(3, 31.5, 14, 1)];
            [_underLine setBackgroundColor:RGB(51, 51, 51)];
            [self.xianZaiBtn addSubview:_underLine];
            
            _xianZaiBtn.selected = YES;
        }
        return self;
    }
    return self;
}

- (void)layoutSubviews {
    //    CGFloat margin = 45.0 / 320 * VIEW_WIDTH;
    WS(ws);
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.top.equalTo(ws.mas_top);
        make.height.equalTo(20);
    }];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.top.equalTo(ws.topView.mas_bottom);
        make.height.equalTo(45);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_backButton.mas_centerY);
        make.left.equalTo(_line2.mas_right).offset(5);
    }];
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.backView.mas_left).offset(15);
        make.bottom.equalTo(ws.backView.mas_bottom).offset(-15);
        make.size.equalTo(CGSizeMake(18, 18));
    }];
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.height.equalTo(0.5);
        make.bottom.equalTo(ws.backView.mas_bottom);
    }];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.topView.mas_bottom);
        make.bottom.equalTo(ws.backView.mas_bottom);
        make.width.equalTo(0.5);
        make.left.equalTo(ws.backButton.mas_right).offset(15);
    }];
    [_suiPianBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.xianZaiBtn.mas_left).offset(-30);
        make.centerY.equalTo(ws.backView.mas_centerY);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    [_xianZaiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.dongTaiBtn.mas_left).offset(-30);
        make.centerY.equalTo(ws.backView.mas_centerY);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    [_dongTaiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right).offset(-30);
        make.centerY.equalTo(ws.backView.mas_centerY);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    
    
}

- (void)suiPianBtnAction:(UIButton *)sender {
    if (sender.selected != YES) {
        sender.selected = YES;
        _xianZaiBtn.selected = NO;
        _dongTaiBtn.selected = NO;
        [_nameLabel setText:@"碎片"];
        [UIView animateWithDuration:0.3 animations:^{
            [_underLine setFrame:CGRectMake(-47, 31.5, 14, 1)];
        }];
    }
}
- (void)xianZaiBtnAction:(UIButton *)sender {
    if (sender.selected != YES) {
        sender.selected = YES;
        _dongTaiBtn.selected = NO;
        _suiPianBtn.selected = NO;
        [_nameLabel setText:@"26/Jan."];
        [UIView animateWithDuration:0.3 animations:^{
            [_underLine setFrame:CGRectMake(3, 31.5, 14, 1)];
        }];
    }
}
- (void)dongTaiBtnAction:(UIButton *)sender {
    if (sender.selected != YES) {
        sender.selected = YES;
        _suiPianBtn.selected = NO;
        _xianZaiBtn.selected = NO;
        [_nameLabel setText:@"动态"];
        [UIView animateWithDuration:0.3 animations:^{
            [_underLine setFrame:CGRectMake(53, 31.5, 14, 1)];
        }];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
