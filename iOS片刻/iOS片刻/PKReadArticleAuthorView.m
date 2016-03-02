//
//  PKReadArticleAuthorView.m
//  iOS片刻
//
//  Created by ma c on 16/1/24.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKReadArticleAuthorView.h"
#import "Masonry.h"
#import "UIButton+WebCache.h"
#import "NSString+Helper.h"

@interface PKReadArticleAuthorView ()

@property (nonatomic,strong) UILabel *authorMessLabel;
@property (nonatomic,strong) UILabel *line;
@property (nonatomic,strong) UIButton *iconBtn;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIButton *careBtn;
@property (nonatomic,strong) UIImageView *shangYinHaoView;
@property (nonatomic,strong) UIImageView *xiaYinHaoView;
@property (nonatomic,strong) UILabel *descMessageLabel;
@property (nonatomic,strong) UIButton *moreButton;
@property (nonatomic,strong) UILabel *line2;

@end

@implementation PKReadArticleAuthorView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        [self setBackgroundColor:RGB(251, 251, 251)];
        
        _authorMessLabel = [[UILabel alloc] init];
        [_authorMessLabel setTextColor:RGB(38, 38, 38)];
        [_authorMessLabel setFont:[UIFont systemFontOfSize:13]];
        [_authorMessLabel setText:@"作者信息"];
        [self addSubview:_authorMessLabel];
        
        _line = [[UILabel alloc] init];
        [_line setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line];
        
        _iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_iconBtn];
        _iconBtn.layer.cornerRadius = 12.5;
        _iconBtn.layer.masksToBounds = YES;
        
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setFont:[UIFont systemFontOfSize:15]];
        [_nameLabel setTextColor:RGB(117, 117, 117)];
        [self addSubview:_nameLabel];
        
        _careBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_careBtn setImage:[UIImage imageNamed:@"guanzhu"] forState:UIControlStateNormal];
        [self addSubview:_careBtn];
        
        _shangYinHaoView = [[UIImageView alloc] init];
        [_shangYinHaoView setImage:[UIImage imageNamed:@"shangyinhao"]];
        [self addSubview:_shangYinHaoView];
        
        _xiaYinHaoView = [[UIImageView alloc] init];
        [_xiaYinHaoView setImage:[UIImage imageNamed:@"xiayinhao"]];
        [self addSubview:_xiaYinHaoView];
        
        _descMessageLabel = [[UILabel alloc] init];
        [_descMessageLabel setTextColor:RGB(85, 85, 85)];
        [_descMessageLabel setFont:[UIFont systemFontOfSize:15.0f]];
        _descMessageLabel.numberOfLines = 0;
        [self addSubview:_descMessageLabel];
        
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreButton setImage:[UIImage imageNamed:@"moreArticle"] forState:UIControlStateNormal];
        [self addSubview:_moreButton];
        
        _line2 = [[UILabel alloc] init];
        [_line2 setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line2];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_authorMessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(20);
        make.top.equalTo(ws.mas_top).offset(20);
        make.size.equalTo(CGSizeMake(60, 15));
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.authorMessLabel.mas_centerY);
        make.left.equalTo(ws.authorMessLabel.mas_right).offset(5);
        make.height.equalTo(0.5);
        make.right.equalTo(ws.mas_right);
    }];
    [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.authorMessLabel.mas_bottom).offset(20);
        make.left.equalTo(ws.authorMessLabel.mas_left);
        make.size.equalTo(CGSizeMake(25, 25));
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.iconBtn.mas_right).offset(5);
        make.centerY.equalTo(ws.iconBtn.mas_centerY);
    }];
    [_careBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.iconBtn.mas_centerY);
        make.right.equalTo(ws.mas_right).offset(-20);
    }];
    [_shangYinHaoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.iconBtn.mas_bottom).offset(10);
        make.left.equalTo(ws.iconBtn.mas_left);
        make.size.equalTo(CGSizeMake(23, 18));
    }];
    [_xiaYinHaoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right).offset(-20);
        make.bottom.equalTo(ws.line2.mas_top).offset(-12);
        make.size.equalTo(CGSizeMake(18, 14));
    }];
    [_descMessageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.shangYinHaoView.mas_right).offset(5);
        make.top.equalTo(ws.shangYinHaoView.mas_top).offset(5);
        make.right.equalTo(ws.xiaYinHaoView.mas_left).offset(-5);
        make.bottom.equalTo(ws.xiaYinHaoView.mas_bottom).offset(-5);
    }];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.bottom.equalTo(ws.mas_bottom).offset(-50);
        make.height.equalTo(0.5);
    }];
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right).offset(-20);
        make.bottom.equalTo(ws.mas_bottom).offset(-15);
    }];
}

- (void)setModel:(PKReadArticleUserinfo *)model {
    _model = model;
    [_nameLabel setText:model.uname];
    [_iconBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.icon] forState:UIControlStateNormal];
    _descMessageLabel.attributedText = [self makeText:model.desc];

}

//生成属性字符串
- (NSAttributedString *)makeText :(NSString *)exampleString{
    //段落类型
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc] init];
    //行间距
    paragraph.lineSpacing = 10;
    //段落间隔
    paragraph.paragraphSpacing = 5;
    //首行缩近
    paragraph.firstLineHeadIndent = 0;
    //属性字典（[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f]指定字符串使用的字体，因为iOS9中字体不是黑体是苹果体，不然在iOS9中字符高度计算容易出现错误）
    NSDictionary * dictA = @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f],
                             //                             NSForegroundColorAttributeName:[UIColor greenColor],
                             //                             NSBackgroundColorAttributeName:[UIColor grayColor],
                             NSParagraphStyleAttributeName:paragraph,
                             //                             NSObliquenessAttributeName:@0.5 //斜体
                             //                             NSStrokeColorAttributeName:[UIColor whiteColor],
                             //                             NSStrokeWidthAttributeName:@2,//描边
                             //                             NSKernAttributeName:@20,//字间距
                             //                             NSStrikethroughStyleAttributeName:@2//删除线
                             //                             NSUnderlineStyleAttributeName:@1,//下划线
                             };
    //返回属性字符串
    NSAttributedString * attribute = [[NSAttributedString alloc] initWithString:exampleString attributes:dictA];
    
    
    return attribute;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
