//
//  PKGoodProductDetailPostView.m
//  iOS片刻
//
//  Created by ma c on 16/1/21.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKGoodProductDetailPostView.h"
#import "Masonry.h"
#import "UIButton+WebCache.h"
#import "NSString+Helper.h"

@interface PKGoodProductDetailPostView ()

@property (nonatomic,strong) UILabel *fromLabel;
@property (nonatomic,strong) UIImageView *louzhuLogo;

@end

@implementation PKGoodProductDetailPostView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setBackgroundColor:RGB(251, 251, 251)];

        _fromLabel = [[UILabel alloc] init];
        [_fromLabel setFont:[UIFont systemFontOfSize:12]];
        [_fromLabel setText:@"from:"];
        [_fromLabel setTextColor:RGB(154, 154, 154)];
        [self addSubview:_fromLabel];
        
        _groupButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_groupButton setTitleColor:RGB(136, 189, 83) forState:UIControlStateNormal];
        [_groupButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:_groupButton];
        
        _moreGroupButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreGroupButton setTitleColor:RGB(136, 189, 83) forState:UIControlStateNormal];
        [_moreGroupButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_moreGroupButton setTitle:@"More·小组 →" forState:UIControlStateNormal];
        [self addSubview:_moreGroupButton];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [self addSubview:_titleLabel];
        
        _iconButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _iconButton.layer.cornerRadius = 25;
        _iconButton.layer.masksToBounds = YES;
        [self addSubview:_iconButton];
        
        _unameLabel = [[UILabel alloc] init];
        [_unameLabel setFont:[UIFont systemFontOfSize:14]];
        [_unameLabel setTextColor:[UIColor blackColor]];
        [self addSubview:_unameLabel];
        
        _louzhuLogo = [[UIImageView alloc] init];
        [_louzhuLogo setImage:[UIImage imageNamed:@"louzhuLogo"]];
        [self addSubview:_louzhuLogo];
        
        _addtimeLabel = [[UILabel alloc] init];
        [_addtimeLabel setTextColor:RGB(154, 154, 154)];
        [_addtimeLabel setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:_addtimeLabel];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(20);
        make.top.equalTo(ws.mas_top).offset(25);
        make.size.equalTo(CGSizeMake(30, 12));
    }];
    [_groupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.fromLabel.mas_right).offset(5);
        make.centerY.equalTo(ws.fromLabel.mas_centerY);
    }];
    [_moreGroupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right).offset(-20);
        make.centerY.equalTo(ws.fromLabel.mas_centerY);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.fromLabel.mas_bottom).offset(30);
        make.left.equalTo(ws.fromLabel.mas_left);
        make.right.equalTo(ws.moreGroupButton.mas_right);
    }];
    [_iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.fromLabel.mas_left);
        make.top.equalTo(ws.titleLabel.mas_bottom).offset(15);
        make.size.equalTo(CGSizeMake(50, 50));
    }];
    [_unameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.iconButton.mas_right).offset(5);
        make.centerY.equalTo(ws.iconButton.mas_centerY);
        make.height.equalTo(15);
    }];
    [_louzhuLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.unameLabel.mas_right).offset(3);
        make.centerY.equalTo(ws.iconButton.mas_centerY);
        make.size.equalTo(CGSizeMake(20, 12));
    }];
    [_addtimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.iconButton.mas_centerY);
        make.right.equalTo(ws.mas_right).offset(-20);
    }];
    
    
}

- (void)setModel:(PKGoodProductDetailPostsinfo *)model {
    [_groupButton setTitle:model.groupInfo.title forState:UIControlStateNormal];
    [_titleLabel setText:model.title];
    [_iconButton sd_setImageWithURL:[NSURL URLWithString:model.userinfo.icon] forState:UIControlStateNormal];
    [_unameLabel setText:model.userinfo.uname];
    [_addtimeLabel setText:model.addtimeF];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
