//
//  PKSuiPianTabelViewCell.m
//  iOS片刻
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKSuiPianTabelViewCell.h"
#import "Masonry.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"

@interface PKSuiPianTabelViewCell ()

@property (nonatomic,strong) UIButton *userIcon;
@property (nonatomic,strong) UILabel *userName;
@property (nonatomic,strong) UILabel *addTime;
@property (nonatomic,strong) UIImageView *coverimg;
@property (nonatomic,strong) UILabel *content;
@property (nonatomic,strong) UIImageView *like;
@property (nonatomic,strong) UILabel *likeNumber;
@property (nonatomic,strong) UIImageView *comment;
@property (nonatomic,strong) UILabel *commentNumber;


@end

@implementation PKSuiPianTabelViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setBackgroundColor:RGB(251, 251, 251)];
        
        _userIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        [_userIcon setBackgroundImage:[UIImage imageNamed:@"userImage"] forState:UIControlStateNormal];
        _userIcon.layer.borderColor = [RGB(221, 221, 221)CGColor];
        _userIcon.layer.borderWidth = 0.5f;
        _userIcon.layer.cornerRadius = 15.0;
        _userIcon.layer.masksToBounds = YES;
        [self.contentView addSubview:_userIcon];

        _userName = [[UILabel alloc] init];
        [_userName setTextColor:RGB(79, 100, 129)];
        [_userName setFont:[UIFont systemFontOfSize:13]];
        [self.contentView addSubview:_userName];
        
        _addTime = [[UILabel alloc] init];
        [_addTime setTextColor:RGB(202, 202, 202)];
        [_addTime setFont:[UIFont systemFontOfSize:12]];
        [self.contentView addSubview:_addTime];
        
        _coverimg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"占位图"]];
        [self.contentView addSubview:_coverimg];
        
        _content = [[UILabel alloc] init];
        [_content setTextColor:RGB(134, 134, 134)];
        [_content setFont:[UIFont systemFontOfSize:15]];
        _content.numberOfLines = 0;
        [self.contentView addSubview:_content];
        
        _like = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"like"]];
        [self.contentView addSubview:_like];
        
        _likeNumber = [[UILabel alloc] init];
        [_likeNumber setFont:[UIFont systemFontOfSize:11]];
        [_likeNumber setTextColor:RGB(191, 191, 191)];
        [self.contentView addSubview:_likeNumber];
        
        _comment = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"comment"]];
        [self.contentView addSubview:_comment];
        
        _commentNumber = [[UILabel alloc] init];
        [_commentNumber setFont:[UIFont systemFontOfSize:11]];
        [_commentNumber setTextColor:RGB(191, 191, 191)];
        [self.contentView addSubview:_commentNumber];
        
    }
    return self;
}

- (void)setFrameModel:(PKSuiPianCellFrameModel *)frameModel {
    _frameModel = frameModel;
    //设置frame
    _userIcon.frame = frameModel.userIconFrame;
    _userName.frame = frameModel.userNameFrame;
    _addTime.frame = frameModel.addTimeFrame;
    _coverimg.frame = frameModel.coverimgFrame;
    _content.frame = frameModel.contentFrame;
    _like.frame = frameModel.likeFrame;
    _likeNumber.frame = frameModel.likeNumberFrame;
    _comment.frame = frameModel.commentFrame;
    _commentNumber.frame = frameModel.commentNumberFrame;
    //给控件赋值
    [_userIcon sd_setImageWithURL:[NSURL URLWithString:frameModel.suiPianList.userinfo.icon] forState:UIControlStateNormal];//设置头像
    [_userName setText:frameModel.suiPianList.userinfo.uname];//设置用户名
    [_addTime setText:frameModel.suiPianList.addtimeF];//设置时间
    if (frameModel.isImage) {
        [_coverimg sd_setImageWithURL:[NSURL URLWithString:frameModel.suiPianList.coverimg]];
    }//判断是否有图片，若有，则设置图片
    [_content setText:frameModel.suiPianList.content];//设置文本内容
    [_likeNumber setText:[NSString stringWithFormat:@"%ld",frameModel.suiPianList.counterList.like]];//喜欢数量
    [_commentNumber setText:[NSString stringWithFormat:@"%ld",frameModel.suiPianList.counterList.comment]];//评论数量
}


//- (void)setFrameModel:(PKSuiPianCellFrameModel *)frameModel {
//    
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
