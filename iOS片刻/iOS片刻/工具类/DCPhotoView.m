//
//  DCPhotoView.m
//  iOS片刻
//
//  Created by ma c on 16/1/27.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "DCPhotoView.h"
#import "Masonry.h"
#import "UIImageView+SDWedImage.h"
#import "PKHomeTodayImglist.h"
#import "UIImageView+WebCache.h"
#define IMAGEPHOTOTAG 4312545432
#define IMAGESCROLLTAG 1254192311

@interface DCPhotoView ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *backScrollView;
@property (nonatomic,strong) UILabel *countLabel;
@property (nonatomic,strong) UIButton *downLoadButton;
@property (nonatomic,assign) NSInteger photoCount;
@property (nonatomic,assign) CGFloat offestX;

@end

@implementation DCPhotoView

- (instancetype)initWithFrame:(CGRect)frame andImageUrls:(NSArray *)imageurls andIndex:(NSInteger)index {
    if (self = [super initWithFrame:frame]) {
        
        self.photoCount = imageurls.count;
        
        _backScrollView = [[UIScrollView alloc] initWithFrame:frame];
        [_backScrollView setBackgroundColor:[UIColor blackColor]];
        [_backScrollView setContentSize:CGSizeMake(VIEW_WIDTH * imageurls.count, VIEW_WIDTH)];
        [_backScrollView setContentOffset:CGPointMake(VIEW_WIDTH * index, 0)];
        _backScrollView.showsHorizontalScrollIndicator = NO;
        _backScrollView.pagingEnabled = YES;
        _backScrollView.delegate = self;
        
//        //设置最大伸缩比例
//       _backScrollView.maximumZoomScale=2.0;
//       //设置最小伸缩比例
//       _backScrollView.minimumZoomScale=0.5;
        
        [self addSubview:_backScrollView];

        
        _countLabel = [[UILabel alloc] init];
        [_countLabel setTextColor:[UIColor whiteColor]];
        [_countLabel setFont:[UIFont systemFontOfSize:15]];
        [_countLabel setText:[NSString stringWithFormat:@"%ld/%ld",index + 1 , imageurls.count]];
        [self addSubview:_countLabel];
        
        _downLoadButton = [UIButton buttonWithType:UIButtonTypeCustom];
      
        [_downLoadButton setTitle:@"下载" forState:UIControlStateNormal];
        [_downLoadButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_downLoadButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [self addSubview:_downLoadButton];
        
        for (NSUInteger i = 0; i < imageurls.count; i++) {
            
            UIScrollView *imageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(VIEW_WIDTH * i, 0, VIEW_WIDTH, VIEW_HEIGHT)];
            imageScroll.tag = IMAGESCROLLTAG + i;
            imageScroll.showsHorizontalScrollIndicator = NO;
            imageScroll.showsVerticalScrollIndicator = NO;
            imageScroll.bounces = NO;
            imageScroll.delegate = self;
            imageScroll.userInteractionEnabled = YES;
            imageScroll.minimumZoomScale = 1.0;
            imageScroll.maximumZoomScale = 5.0;
            [imageScroll setZoomScale:1.0];
            [_backScrollView addSubview:imageScroll];
            
            UIImageView *photoView = [[UIImageView alloc] initWithFrame:CGRectMake(4, 0, VIEW_WIDTH - 8, VIEW_HEIGHT)];
            [photoView downloadImage:[imageurls[i] imgurl] place:[UIImage imageNamed:@"占位图"]];
//            [photoView sd_setImageWithURL:[NSURL URLWithString:[imageurls[i] imgurl]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                CGFloat width = image.size.width;
//                CGFloat height = image.size.height;
//                NSNumber *imageW = [NSNumber numberWithFloat:VIEW_WIDTH - 8];
////                NSNumber *imageH = [NSNumber numberWithFloat:()]
//                
//            }];
            photoView.userInteractionEnabled = YES;
            photoView.tag = i + IMAGEPHOTOTAG;
            [photoView setContentMode:UIViewContentModeScaleAspectFit];
            [imageScroll addSubview:photoView];
            
//            UITapGestureRecognizer *doubleTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
//            [doubleTap setNumberOfTapsRequired:2];
//            [doubleTap setNumberOfTouchesRequired:1];
//            [photoView addGestureRecognizer:doubleTap];
        }
    
    }
    return self;
}
- (void)layoutSubviews {
    WS(ws);
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(25);
        make.bottom.equalTo(ws.mas_bottom).offset(-15);
    }];
    [_downLoadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right).offset(-25);
        make.bottom.equalTo(ws.mas_bottom).offset(-15);
    }];
}


#pragma mark -
- (void)handleDoubleTap:(UIGestureRecognizer *)gesture{
    NSLog(@"放大！");
    //新的放大倍数
//    float newScale = [(UIScrollView*)gesture.view.superview zoomScale] * 3.0;
    float newScale = 3.0;
//    CGRect zoomRect = [self zoomRectForScale:newScale  inView:(UIScrollView*)gesture.view.superview withCenter:[gesture locationInView:gesture.view]];
//    UIView *view = gesture.view.superview;
//    if ([view isKindOfClass:[UIScrollView class]]){
//        UIScrollView *s = (UIScrollView *)view;
//        [s zoomToRect:zoomRect animated:YES];
//    }
//    UIScrollView *s = (UIScrollView *)gesture.view.superview;
//    [s setTransform:CGAffineTransformMakeScale(newScale, newScale)];
//    s zoomToRect:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>) animated:<#(BOOL)#>
    
    
    
}
#pragma mark - Utility methods
- (CGRect)zoomRectForScale:(float)scale inView:(UIScrollView*)scrollView withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    
    zoomRect.size.height = [scrollView frame].size.height / scale;
    zoomRect.size.width  = [scrollView frame].size.width  / scale;
    
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / VIEW_WIDTH + 1;
    [_countLabel setText:[NSString stringWithFormat:@"%ld/%ld",index , self.photoCount]];
//    if (scrollView == self.backScrollView) {
//
//        CGFloat x = scrollView.contentOffset.x;
//        if (x==self.offestX){
//            
//        }
//        else {
//            self.offestX = x;
//            for (UIScrollView *s in scrollView.subviews){
//                if ([s isKindOfClass:[UIScrollView class]]){
//                    [s setZoomScale:1.0];
//                    UIImageView *image = [[s subviews] objectAtIndex:0];
//                    image.frame = CGRectMake(20, 0, 320, 460);
//                }
//            }
//        }
//        
//    }

}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    UIImageView *image = [scrollView viewWithTag:scrollView.tag - IMAGESCROLLTAG + IMAGEPHOTOTAG];
    return image;
    
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
