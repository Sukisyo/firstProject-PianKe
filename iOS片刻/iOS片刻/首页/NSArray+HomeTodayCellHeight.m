//
//  NSArray+HomeTodayCellHeight.m
//  iOS片刻
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "NSArray+HomeTodayCellHeight.h"
#import "PKHomeTodayList.h"
#import "NSString+Helper.h"

@implementation NSArray (HomeTodayCellHeight)

+ (NSMutableArray *)calculateCellHeightsWithModels:(NSArray *)models {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    for (PKHomeTodayList *model in models) {
        
        CGFloat titleHeight = [NSString autoHeightWithString:model.title Width:VIEW_WIDTH - 40 Font:[UIFont boldSystemFontOfSize:20]];
        CGFloat contentHeight = [NSString autoHeightWithString:model.content Width:VIEW_WIDTH - 40 Font:[UIFont systemFontOfSize:15]];
        NSNumber *cellHeight;
        if (model.type == 24) {
            NSArray *sizeArr = [model.coverimgWh componentsSeparatedByString:@"*"];
            CGFloat imageH = [sizeArr[1] floatValue] * VIEW_WIDTH / [sizeArr[0] floatValue];
            cellHeight = [NSNumber numberWithFloat:(70 + 60 + contentHeight + imageH)];
        }else if (model.type == 4 || model.type == 17) {
            cellHeight = [NSNumber numberWithFloat:(70 + 20 + 60 + titleHeight + contentHeight + 286 * VIEW_WIDTH / 320)];
        }else {
            cellHeight = [NSNumber numberWithFloat:(70 + 20 + 60 + titleHeight + contentHeight + 120 * VIEW_WIDTH / 320)];
        }

        [arr addObject:cellHeight];
    }
    
    return arr;
}

@end
