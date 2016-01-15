//
//  PKThirdLoginView.m
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKThirdLoginView.h"
#import "Masonry.h"

@interface PKThirdLoginView ()

@property (nonatomic,strong) UIButton *sinaBtn;
@property (nonatomic,strong) UIButton *renrenBtn;
@property (nonatomic,strong) UIButton *doubanBtn;
@property (nonatomic,strong) UIButton *tecentBtn;

@property (nonatomic,strong) UILabel *descLabel;
@property (nonatomic,strong) UIImageView *leftLine;
@property (nonatomic,strong) UIImageView *rightLine;

@end

@implementation PKThirdLoginView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _sinaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_sinaBtn];
        [_sinaBtn setImage:[UIImage imageNamed:@"新浪"] forState:UIControlStateNormal];
        _renrenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_renrenBtn];
        [_renrenBtn setImage:[UIImage imageNamed:@"人人"] forState:UIControlStateNormal];
        _doubanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_doubanBtn];
        [_doubanBtn setImage:[UIImage imageNamed:@"豆瓣"] forState:UIControlStateNormal];
        _tecentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_tecentBtn];
        [_tecentBtn setImage:[UIImage imageNamed:@"腾讯"] forState:UIControlStateNormal];
        
        _descLabel = [[UILabel alloc] init];
        [self addSubview:_descLabel];
        [_descLabel setTextAlignment:NSTextAlignmentCenter];
        [_descLabel setText:@"合作伙伴登录片刻"];
        [_descLabel setTextColor:RGB(38, 38, 38)];
        [_descLabel setFont:[UIFont systemFontOfSize:13]];
        _leftLine = [[UIImageView alloc] init];
        [self addSubview:_leftLine];
        [_leftLine setBackgroundColor:RGB(221, 221, 221)];
        _rightLine = [[UIImageView alloc] init];
        [self addSubview:_rightLine];
        [_rightLine setBackgroundColor:RGB(221, 221, 221)];
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    CGFloat margin = (VIEW_WIDTH - 28 * 4) / 5;
    [_sinaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(28, 28));
        make.left.equalTo(ws.mas_left).offset(margin);
        make.bottom.equalTo(ws.mas_bottom).offset(-37);
    }];
    [_renrenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_sinaBtn.mas_centerY);
        make.size.equalTo(CGSizeMake(28, 28));
        make.left.equalTo(ws.sinaBtn.mas_right).offset(margin);
    }];
    [_doubanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_renrenBtn.mas_centerY);
        make.size.equalTo(CGSizeMake(28, 28));
        make.left.equalTo(ws.renrenBtn.mas_right).offset(margin);
    }];
    [_tecentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_doubanBtn.mas_centerY);
        make.size.equalTo(CGSizeMake(28, 28));
        make.left.equalTo(ws.doubanBtn.mas_right).offset(margin);
    }];
    
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.mas_centerX);
        make.bottom.equalTo(ws.sinaBtn.mas_top).offset(-30);
//        make.width.equalTo(100);
    }];
    [_leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.sinaBtn.mas_left);
        make.centerY.equalTo(ws.descLabel.mas_centerY);
        make.height.equalTo(1);
        make.right.equalTo(ws.descLabel.mas_left).offset(-5);
    }];
    [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.tecentBtn.mas_right);
        make.centerY.equalTo(ws.descLabel.mas_centerY);
        make.height.equalTo(1);
        make.left.equalTo(ws.descLabel.mas_right).offset(5);
    }];
    
}









/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
