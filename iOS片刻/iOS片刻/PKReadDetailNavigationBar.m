//
//  PKReadDetailNavigationBar.m
//  iOS片刻
//
//  Created by ma c on 16/1/23.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKReadDetailNavigationBar.h"
#import "Masonry.h"

@interface PKReadDetailNavigationBar ()

@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UILabel *line1;//横向的线
@property (nonatomic,strong) UILabel *line2;//纵向的线


@end

@implementation PKReadDetailNavigationBar

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
            [_backButton setImage:[UIImage imageNamed:@"返回箭头"] forState:UIControlStateNormal];
            [self addSubview:_backButton];
            
            _nameLabel = [[UILabel alloc] init];
            [_nameLabel setTextColor:[UIColor blackColor]];
            [_nameLabel setFont:[UIFont systemFontOfSize:15]];
            [self addSubview:_nameLabel];
            
            _line1 = [[UILabel alloc] init];
            [_line1 setBackgroundColor:RGB(221, 221, 221)];
            [self addSubview:_line1];
            
            _line2 = [[UILabel alloc] init];
            [_line2 setBackgroundColor:RGB(221, 221, 221)];
            [self addSubview:_line2];
            
            _addtimeButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_addtimeButton setBackgroundImage:[UIImage imageNamed:@"new_normal"] forState:UIControlStateNormal];
            [_addtimeButton setBackgroundImage:[UIImage imageNamed:@"new_selected"] forState:UIControlStateSelected];
            [_addtimeButton addTarget:self action:@selector(addtimeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_addtimeButton];

            _hotButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_hotButton setBackgroundImage:[UIImage imageNamed:@"hot_normal"] forState:UIControlStateNormal];
            [_hotButton setBackgroundImage:[UIImage imageNamed:@"hot_selected"] forState:UIControlStateSelected];
            [_hotButton addTarget:self action:@selector(hotBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_hotButton];
            
            _underLine = [[UILabel alloc] initWithFrame:CGRectMake(3, 31.5, 14, 1)];
            [_underLine setBackgroundColor:RGB(51, 51, 51)];
            [self.addtimeButton addSubview:_underLine];
            
            _addtimeButton.selected = YES;
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
    [_hotButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right).offset(-30);
        make.centerY.equalTo(ws.backView.mas_centerY);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    [_addtimeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.hotButton.mas_left).offset(-30);
        make.centerY.equalTo(ws.backView.mas_centerY);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    

    
}

- (void)addtimeBtnAction:(UIButton *)sender {
    if (sender.selected != YES) {
        sender.selected = YES;
        _hotButton.selected = NO;
        [UIView animateWithDuration:0.3 animations:^{
            [_underLine setFrame:CGRectMake(3, 31.5, 14, 1)];
        }];
    }
}
- (void)hotBtnAction:(UIButton *)sender {
    if (sender.selected != YES) {
        sender.selected = YES;
        _addtimeButton.selected = NO;
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
