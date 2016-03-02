//
//  PKHomeTodayTableView.m
//  iOS片刻
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKHomeTodayTableView.h"
#import "Masonry.h"
#import "PKHomeTodayList.h"
#import "PKHomeTodayOtherTableViewCell.h"
#import "PKHomeTodayIllustrationTableViewCell.h"  //17,4 插画 摄影
#import "PKHomeTodayTopicTableViewCell.h"  //3
#import "PKHomeTodaySoundTableViewCell.h"  //2
#import "PKHomeTodayMusicTableViewCell.h"  //5
#import "PKHomeTodayTimelineTableViewCell.h"   //24


static NSString *TopicIdentifier = @"hometodaytopiccell";
static NSString *SoundIdentifier = @"hometodaysoundcell";
static NSString *MusicIdentifier = @"hometodaymusiccell";
static NSString *OtherIdentifier = @"hometodayothercell";
static NSString *TimelineIdentifier = @"hometodaytimelinecell";
static NSString *IllustrationIdentifier = @"hometodayillustrationcell";

@interface PKHomeTodayTableView ()



@end

@implementation PKHomeTodayTableView{
    CGFloat lastOffestY;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
        [self setBackgroundColor:RGB(251, 251, 251)];
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerClass:[PKHomeTodayOtherTableViewCell class] forCellReuseIdentifier:OtherIdentifier];
        [self registerClass:[PKHomeTodayTopicTableViewCell class] forCellReuseIdentifier:TopicIdentifier];//话题
        [self registerClass:[PKHomeTodaySoundTableViewCell class] forCellReuseIdentifier:SoundIdentifier];//Ting
        [self registerClass:[PKHomeTodayMusicTableViewCell class] forCellReuseIdentifier:MusicIdentifier];//音乐
        [self registerClass:[PKHomeTodayIllustrationTableViewCell class] forCellReuseIdentifier:IllustrationIdentifier];//摄影
        [self registerClass:[PKHomeTodayTimelineTableViewCell class] forCellReuseIdentifier:TimelineIdentifier];//碎片
        [self addHeadRefreshWithAction:@selector(headRefreshAction)];
        [self addFootRefreshWithAction:@selector(footRefreshAction)];
        
        

        
        
    }
    return self;
}


- (void)headRefreshAction {
    if ([self.refreshDelegate respondsToSelector:@selector(reloadData)]) {
        [self.refreshDelegate reloadData];
    }
}
- (void)footRefreshAction {
    if ([self.refreshDelegate respondsToSelector:@selector(loadMoreData)]) {
        [self.refreshDelegate loadMoreData];
    }
}

#pragma mark - UITableViewDataSource 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellModels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    PKHomeTodayList *model = self.cellModels[indexPath.row];
    NSInteger type = model.type;
    switch (type) {
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:TopicIdentifier forIndexPath:indexPath];
            ((PKHomeTodayTopicTableViewCell *)cell).model = model;
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:SoundIdentifier forIndexPath:indexPath];
            ((PKHomeTodaySoundTableViewCell *)cell).model = model;
            break;
        case 5:
            cell = [tableView dequeueReusableCellWithIdentifier:MusicIdentifier forIndexPath:indexPath];
            ((PKHomeTodayMusicTableViewCell *)cell).model = model;
            break;
        case 17:
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:IllustrationIdentifier forIndexPath:indexPath];
            ((PKHomeTodayIllustrationTableViewCell *)cell).model = model;
            break;
        case 24:
            cell = [tableView dequeueReusableCellWithIdentifier:TimelineIdentifier forIndexPath:indexPath];
            ((PKHomeTodayTimelineTableViewCell *)cell).model = model;
            break;
        default:
            cell = [tableView dequeueReusableCellWithIdentifier:OtherIdentifier forIndexPath:indexPath];
            ((PKHomeTodayOtherTableViewCell *)cell).model = model;
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellHeights[indexPath.row] floatValue];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (lastOffestY > scrollView.contentOffset.y) {
        if ([self.refreshDelegate respondsToSelector:@selector(presentBackView)]) {
            [self.refreshDelegate presentBackView];
        }
        
    }else {
        if ([self.refreshDelegate respondsToSelector:@selector(hideBackView)]) {
            [self.refreshDelegate hideBackView];
        }
    }
    
    lastOffestY = scrollView.contentOffset.y;
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
