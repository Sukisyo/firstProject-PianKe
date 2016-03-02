//
//  NSArray+ReadCellHeight.m
//  iOS片刻
//
//  Created by ma c on 16/1/23.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "NSArray+ReadCellHeight.h"
#import "PKReadDetailReadList.h"
#import "NSString+Helper.h"

@implementation NSArray (ReadCellHeight)

+ (NSMutableArray *)readCellHeightsWithModels:(NSArray *)models {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (PKReadDetailReadList *list in models) {
        
        CGFloat height = [NSString autoHeightWithString:list.title Width:VIEW_WIDTH - 40 Font:[UIFont boldSystemFontOfSize:20]] + 120;
        
        NSNumber *heightNumber = [NSNumber numberWithDouble:height];
        [array addObject:heightNumber];
    }
    
    
    return array;
}

@end
