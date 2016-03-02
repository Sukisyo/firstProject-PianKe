//
//  PKGoodProductDetailCommentView.m
//  iOS片刻
//
//  Created by ma c on 16/1/21.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKGoodProductDetailCommentView.h"
#import "Masonry.h"

@interface PKGoodProductDetailCommentView ()

@property (nonatomic,strong) UILabel *line1;
@property (nonatomic,strong) UILabel *line2;

@end

@implementation PKGoodProductDetailCommentView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setBackgroundColor:RGB(251, 251, 251)];
        
        _line1 = [[UILabel alloc] init];
        [_line1 setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line1];
        
        _line2 = [[UILabel alloc] init];
        [_line2 setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line2];
        
        _onlyReadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_onlyReadButton setBackgroundImage:[UIImage imageNamed:@"onlyRead_normal"] forState:UIControlStateNormal];
        [_onlyReadButton setBackgroundImage:[UIImage imageNamed:@"onlyRead_selected"] forState:UIControlStateSelected];
        [_onlyReadButton addTarget:self action:@selector(onlyReadAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_onlyReadButton];
        
        _orderReadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_orderReadButton setBackgroundImage:[UIImage imageNamed:@"orderRead_normal"] forState:UIControlStateNormal];
        [_orderReadButton setBackgroundImage:[UIImage imageNamed:@"orderRead_selected"] forState:UIControlStateSelected];
        [_orderReadButton addTarget:self action:@selector(orderReadAction:) forControlEvents:UIControlEventTouchUpInside];
        _orderReadButton.selected = YES;
        [self addSubview:_orderReadButton];
        
        _hotCommentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_hotCommentButton setBackgroundImage:[UIImage imageNamed:@"hotComment_normal"] forState:UIControlStateNormal];
        [_hotCommentButton setBackgroundImage:[UIImage imageNamed:@"hotComment_selected"] forState:UIControlStateSelected];
        [_hotCommentButton addTarget:self action:@selector(hotCommentAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_hotCommentButton];
        
    }
    return self;
}

- (void)onlyReadAction:(UIButton *)sender {
    if (sender.selected == NO) {
        sender.selected = YES;
        _orderReadButton.selected = NO;
        _hotCommentButton.selected = NO;
    }
}
- (void)orderReadAction:(UIButton *)sender {
    if (sender.selected == NO) {
        sender.selected = YES;
        _onlyReadButton.selected = NO;
        _hotCommentButton.selected = NO;
    }
}
- (void)hotCommentAction:(UIButton *)sender {
    if (sender.selected == NO) {
        sender.selected = YES;
        _onlyReadButton.selected = NO;
        _orderReadButton.selected = NO;
    }
}

- (void)layoutSubviews {
    CGFloat width1 = 90.0 / 320 * VIEW_WIDTH;
    CGFloat width2 = 105.0 / 320 * VIEW_WIDTH;
    
    WS(ws);
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top);
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.height.equalTo(0.5);
    }];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.mas_bottom);
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.height.equalTo(0.5);
    }];
    [_onlyReadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.line1.mas_bottom).offset(10);
        make.left.equalTo(ws.mas_left).offset(10);
        make.size.equalTo(CGSizeMake(width1, 30));
    }];
    [_orderReadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.onlyReadButton.mas_centerY);
        make.left.equalTo(ws.onlyReadButton.mas_right).offset(10);
        make.size.equalTo(CGSizeMake(width2, 30));
    }];
    [_hotCommentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.orderReadButton.mas_right).offset(10);
        make.centerY.equalTo(ws.onlyReadButton.mas_centerY);
        make.size.equalTo(CGSizeMake(width1, 30));
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
