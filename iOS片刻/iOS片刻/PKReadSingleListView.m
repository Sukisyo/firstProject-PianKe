//
//  PKReadSingleListView.m
//  iOS片刻
//
//  Created by ma c on 16/1/22.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKReadSingleListView.h"
#import "Masonry.h"
#import "UIButton+WebCache.h"


@interface PKReadSingleListView ()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *ennameLabel;

@end

@implementation PKReadSingleListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _backImage = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_backImage];
        
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setTextColor:[UIColor whiteColor]];
        [_nameLabel setFont:[UIFont systemFontOfSize:13]];
        [self addSubview:_nameLabel];
        
        _ennameLabel = [[UILabel alloc] init];
        [_ennameLabel setTextColor:[UIColor whiteColor]];
        [_ennameLabel setFont:[UIFont systemFontOfSize:10]];
        [self addSubview:_ennameLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.bottom.equalTo(ws.mas_bottom);
        make.top.equalTo(ws.mas_top);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.backImage.mas_bottom).offset(-5);
        make.left.equalTo(ws.backImage.mas_left).offset(5);
    }];
    [_ennameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.backImage.mas_bottom).offset(-5);
        make.left.equalTo(ws.nameLabel.mas_right).offset(5);
    }];
}

- (void)setListModel:(PKReadList *)listModel {
    [_backImage sd_setBackgroundImageWithURL:[NSURL URLWithString:listModel.coverimg] forState:UIControlStateNormal];
    [_nameLabel setText:listModel.name];
    [_ennameLabel setText:listModel.enname];
}

@end
