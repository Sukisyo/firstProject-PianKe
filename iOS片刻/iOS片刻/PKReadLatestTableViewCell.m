//
//  PKReadLatestTableViewCell.m
//  iOS片刻
//
//  Created by ma c on 16/1/24.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKReadLatestTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface PKReadLatestTableViewCell ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UILabel *line;

@end

@implementation PKReadLatestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
        [_titleLabel setTextColor:[UIColor blackColor]];
        _titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_titleLabel];
        
        _iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconView];
        
        _contentLabel = [[UILabel alloc] init];
        [_contentLabel setTextColor:RGB(83, 83, 83)];
        [_contentLabel setFont:[UIFont systemFontOfSize:15]];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        
        _line = [[UILabel alloc] init];
        [_line setBackgroundColor:RGB(221, 221, 221)];
        [self.contentView addSubview:_line];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left);
        make.right.equalTo(ws.contentView.mas_right);
        make.bottom.equalTo(ws.contentView.mas_bottom);
        make.height.equalTo(0.5);
    }];
}

- (void)setTitleHeight:(CGFloat)titleHeight {
    _titleHeight = titleHeight;
    [_titleLabel setFrame:CGRectMake(20, 27, VIEW_WIDTH - 40, titleHeight)];
    if (_isImage) {
        [_iconView setFrame:CGRectMake(20, CGRectGetMaxY(_titleLabel.frame) + 20, 130, 60)];
        [_contentLabel setFrame:CGRectMake(CGRectGetMaxX(_iconView.frame) + 5, _iconView.frame.origin.y + 3, VIEW_WIDTH - 20 - 20 - 130 - 5, 60)];
    }else {
        [_contentLabel setFrame:CGRectMake(20, CGRectGetMaxY(_titleLabel.frame) + 20, VIEW_WIDTH - 40, 60)];
    }
}


- (void)setModel:(PKReadLatestList *)model {
    _model = model;
    [_titleLabel setText:model.title];
    [_contentLabel setText:model.shortcontent];
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.firstimage]];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
