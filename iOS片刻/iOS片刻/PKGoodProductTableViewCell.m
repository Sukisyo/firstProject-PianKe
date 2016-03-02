//
//  PKGoodProductTableViewCell.m
//  iOS片刻
//
//  Created by ma c on 16/1/21.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKGoodProductTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface PKGoodProductTableViewCell ()

@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *descLabel;
@property (nonatomic,strong) UIButton *buyButton;
@property (nonatomic,strong) UILabel *line;

@end

@implementation PKGoodProductTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconView];
        
        _descLabel = [[UILabel alloc] init];
        [_descLabel setTextColor:[UIColor blackColor]];
        [_descLabel setFont:[UIFont systemFontOfSize:13]];
        [self.contentView addSubview:_descLabel];
        
        _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _buyButton.layer.cornerRadius = 11;
        _buyButton.layer.masksToBounds = YES;
        [_buyButton setBackgroundColor:RGB(104, 170, 45)];
        [_buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
        [_buyButton.titleLabel setFont:[UIFont systemFontOfSize:11]];
        [self.contentView addSubview:_buyButton];
        
        _line = [[UILabel alloc] init];
        [_line setBackgroundColor:RGB(221, 221, 221)];
        [self.contentView addSubview:_line];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }

    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.right.equalTo(ws.contentView.mas_right).offset(-20);
        make.top.equalTo(ws.contentView.mas_top).offset(20);
        make.height.equalTo(140);
    }];
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.iconView.mas_left);
        make.top.equalTo(ws.iconView.mas_bottom).offset(16);
        make.right.equalTo(ws.buyButton.mas_left).offset(-20);
        make.height.equalTo(20);
    }];
    [_buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.iconView.mas_right);
        make.centerY.equalTo(ws.descLabel.mas_centerY);
        make.size.equalTo(CGSizeMake(60, 23));
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left);
        make.right.equalTo(ws.contentView.mas_right);
        make.height.equalTo(1);
        make.bottom.equalTo(ws.contentView.mas_bottom);
    }];
}

- (void)setModel:(PKGoodProductList *)model {
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
    [_descLabel setText:model.title];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
