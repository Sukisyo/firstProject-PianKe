//
//  PKReadListsView.m
//  iOS片刻
//
//  Created by ma c on 16/1/22.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKReadListsView.h"
#import "PKReadSingleListView.h"
#import "Masonry.h"

#define LISTBUTTONTAG 1234567

@interface PKReadListsView ()

@property (nonatomic,strong) NSArray *lists;

@end

@implementation PKReadListsView

- (instancetype)initWithFrame:(CGRect)frame andLists:(NSArray *)lists {
    if (self = [super initWithFrame:frame]) {
        
        self.lists = lists;
        for (NSInteger i = 0; i < lists.count; i++) {
            
            NSInteger line = i / 3;
            NSInteger row = i % 3;
            
            CGFloat margin1 = 7;
            CGFloat margin2 = 4;
            
            CGFloat imageW = (VIEW_WIDTH - (margin1 + margin2) * 2) / 3;
            CGFloat imageH = imageW;
            CGFloat imageX = margin1 + (imageW + margin2) * row;
            CGFloat imageY = margin1 + (imageW + margin2) * line;
            PKReadSingleListView *listView = [[PKReadSingleListView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
            listView.backImage.tag = LISTBUTTONTAG + i;
            [listView.backImage addTarget:self action:@selector(listButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:listView];
            listView.listModel = lists[i];
            
        }
        
        _writingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_writingBtn setBackgroundImage:[UIImage imageNamed:@"newWriting"] forState:UIControlStateNormal];
        [self addSubview:_writingBtn];
        
        
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_writingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(7);
        make.right.equalTo(ws.mas_right).offset(-7);
        make.bottom.equalTo(ws.mas_bottom).offset(-7);
        make.height.equalTo(100);
    }];
}

- (void)listButtonAction:(UIButton *)sender {
    NSInteger index = sender.tag - LISTBUTTONTAG;
    NSString *typeid = [NSString stringWithFormat:@"%ld",[self.lists[index] typeId]];
    if ([self.delegate respondsToSelector:@selector(pushToListDetailVCWithTypeid:)]) {
        [self.delegate pushToListDetailVCWithTypeid:typeid];
    }
}

@end
