//
//  NSArray+cellHeight.m
//  iOS片刻
//
//  Created by ma c on 16/1/22.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "NSArray+cellHeight.h"
#import "NSString+Helper.h"
#import "PKGoodProductDetailCommentlist.h"

@implementation NSArray (cellHeight)

+ (NSMutableArray *)autoCalculateHeightsWithModel:(NSArray *)model {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    if (model.count != 0) {
        for (PKGoodProductDetailCommentlist *listModel in model) {
            
            CGFloat textHeight = [NSString autoHeightWithString:listModel.content Width:(VIEW_WIDTH - 40) Font:[UIFont systemFontOfSize:15]];
            NSNumber *textH = [NSNumber numberWithFloat:textHeight];
            CGFloat imgHeight;
            CGFloat cellHeight;
            BOOL isImage;
            if (![listModel.coverimgWh isEmptyString]) {
                
                NSArray *imageSize = [listModel.coverimgWh componentsSeparatedByString:@"*"];
                imgHeight = VIEW_WIDTH / [imageSize[0] floatValue] * [imageSize[1] floatValue];
                isImage = YES;
            }else {
                imgHeight = 0;
                isImage = NO;
            }
            NSNumber *imageH = [NSNumber numberWithFloat:imgHeight];
            
            if (isImage) {
                cellHeight = 65 + 15 + textHeight + 15 + imgHeight + 15;
            }else {
                cellHeight = 65 + 15 + textHeight + 15;
            }
            NSNumber *cellH = [NSNumber numberWithFloat:cellHeight];
            
            NSDictionary *heightDic = @{
                                        @"textHeight" : textH,
                                        @"imageHeight" : imageH,
                                        @"cellHeight" : cellH
                                        };
            
            [array addObject:heightDic];
            
        }
    }
    return array;
}

@end
