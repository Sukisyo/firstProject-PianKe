//
//  PKGoodProductDetailNaviBarView.m
//  iOS片刻
//
//  Created by ma c on 16/1/21.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKGoodProductDetailNaviBarView.h"
#import "Masonry.h"

@interface PKGoodProductDetailNaviBarView ()


@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UILabel *line1;//横向的线
@property (nonatomic,strong) UILabel *line2;//纵向的线

@end

@implementation PKGoodProductDetailNaviBarView

- (instancetype)init
{
    self = [super init];
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
        
        _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentButton setImage:[UIImage imageNamed:@"评论"] forState:UIControlStateNormal];
        [self addSubview:_commentButton];
        
        _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        [self addSubview:_likeButton];
        
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
        [self addSubview:_shareButton];
        
        _commentNumber = [[UILabel alloc] init];
        [_commentNumber setTextColor:RGB(50, 50, 50)];
        [_commentNumber setFont:[UIFont systemFontOfSize:11]];
        [self addSubview:_commentNumber];
//        [_commentNumber setText:@"45"];
        
        _likeNumber = [[UILabel alloc] init];
        [_likeNumber setTextColor:RGB(50, 50, 50)];
        [_likeNumber setFont:[UIFont systemFontOfSize:11]];
        [self addSubview:_likeNumber];
//        [_likeNumber setText:@"251"];
        
        _line1 = [[UILabel alloc] init];
        [_line1 setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line1];
        
        _line2 = [[UILabel alloc] init];
        [_line2 setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line2];
        
    }
    return self;
}

- (void)layoutSubviews {
    CGFloat margin = 45.0 / 320 * VIEW_WIDTH;
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
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.backView.mas_left).offset(15);
        make.bottom.equalTo(ws.backView.mas_bottom).offset(-15);
        make.size.equalTo(CGSizeMake(18, 18));
    }];
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.height.equalTo(1);
        make.bottom.equalTo(ws.backView.mas_bottom);
    }];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.topView.mas_bottom);
        make.bottom.equalTo(ws.backView.mas_bottom);
        make.width.equalTo(1);
        make.left.equalTo(ws.backButton.mas_right).offset(15);
    }];
    [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.backView.mas_right).offset(-20);
        make.centerY.equalTo(ws.backButton.mas_centerY);
        make.size.equalTo(CGSizeMake(25, 25));
    }];
    [_likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.shareButton.mas_left).offset(-margin);
        make.centerY.equalTo(ws.backButton.mas_centerY);
        make.size.equalTo(CGSizeMake(25, 25));
    }];
    [_commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.likeButton.mas_left).offset(-margin);
        make.centerY.equalTo(ws.backButton.mas_centerY);
        make.size.equalTo(CGSizeMake(25, 25));
    }];
    [_commentNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.backButton.mas_centerY);
        make.left.equalTo(ws.commentButton.mas_right).offset(5);
    }];
    [_likeNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.backButton.mas_centerY);
        make.left.equalTo(ws.likeButton.mas_right).offset(5);
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
