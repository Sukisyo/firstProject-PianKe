//
//	PKHomeTodayData.h
//
//	Create by c ma on 26/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKHomeTodayCarousel.h"
#import "PKHomeTodayList.h"

@interface PKHomeTodayData : NSObject

@property (nonatomic, strong) NSArray * carousel;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end