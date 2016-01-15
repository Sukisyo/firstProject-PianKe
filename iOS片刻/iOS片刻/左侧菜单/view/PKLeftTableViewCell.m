//
//  PKLeftTableViewCell.m
//  iOS片刻
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKLeftTableViewCell.h"
#import "Masonry.h"

@interface PKLeftTableViewCell ()

@property (weak,nonatomic) UIImageView *iconView;
@property (weak,nonatomic) UILabel *descLabel;

@end

@implementation PKLeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        UILabel *descLabel = [[UILabel alloc] init];
        [self.contentView addSubview:descLabel];
        [descLabel setTextColor:[UIColor whiteColor]];
        self.descLabel = descLabel;

    }
    return self;
}
- (void)layoutSubviews {
    WS(ws);
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left).offset(30);
        make.centerY.equalTo(ws.contentView.mas_centerY);
        make.size.equalTo(CGSizeMake(25, 25));
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(25);
        make.centerY.equalTo(ws.contentView.mas_centerY);
    }];
}

- (void)setName:(NSString *)name {
    _name = name;
    [self.iconView setImage:[UIImage imageNamed:name]];
    [self.descLabel setText:name];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
