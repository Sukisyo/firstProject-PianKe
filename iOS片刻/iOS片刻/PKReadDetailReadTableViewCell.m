//
//  PKReadDetailReadTableViewCell.m
//  iOS片刻
//
//  Created by ma c on 16/1/23.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKReadDetailReadTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface PKReadDetailReadTableViewCell ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *descLabel;
@property (nonatomic,strong) UIImageView *descImage;
@property (nonatomic,strong) UILabel *line;

@end

@implementation PKReadDetailReadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [self.contentView addSubview:_titleLabel];
        
        _descLabel = [[UILabel alloc] init];
        _descLabel.numberOfLines = 0;
        [_descLabel setFont:[UIFont systemFontOfSize:15]];
        [_descLabel setTextColor:RGB(83, 83, 83)];
        [self.contentView addSubview:_descLabel];
        
        _descImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_descImage];
        
        _line = [[UILabel alloc] init];
        [_line setBackgroundColor:RGB(221, 221, 221)];
        [self.contentView addSubview:_line];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.contentView.mas_top).offset(27);
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.right.equalTo(ws.contentView.mas_right).offset(-20);
    }];
    [_descImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.bottom.equalTo(ws.contentView.mas_bottom).offset(-18);
        make.size.equalTo(CGSizeMake(130, 60));
    }];
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.descImage.mas_right).offset(5);
        make.top.equalTo(ws.descImage.mas_top).offset(2);
        make.right.equalTo(ws.contentView.mas_right).offset(-20);
        make.bottom.equalTo(ws.contentView.mas_bottom).offset(-18);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left);
        make.right.equalTo(ws.contentView.mas_right);
        make.bottom.equalTo(ws.contentView.mas_bottom);
        make.height.equalTo(1);
    }];
}

- (void)setModel:(PKReadDetailReadList *)model {
    [_titleLabel setText:model.title];
    [_descLabel setText:model.content];
    [_descImage sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
