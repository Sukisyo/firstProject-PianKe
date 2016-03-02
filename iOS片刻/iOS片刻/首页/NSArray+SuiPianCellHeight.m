//
//  NSArray+SuiPianCellHeight.m
//  iOS片刻
//
//  Created by ma c on 16/1/25.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "NSArray+SuiPianCellHeight.h"
#import "PKSuiPianDetailCommentlist.h"
#import "NSString+Helper.h"

@implementation NSArray (SuiPianCellHeight)

+ (NSMutableArray *)autoCalculateHeightsWithModel:(NSArray *)model {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (PKSuiPianDetailCommentlist *list in model) {
        
        CGFloat textHeight = [NSString autoHeightWithString:list.content Width:VIEW_WIDTH - 40 Font:[UIFont systemFontOfSize:14]];
        NSNumber *cellHeight = [NSNumber numberWithFloat:textHeight + 90];
        [arr addObject:cellHeight];
    }
    return arr;
}

@end
