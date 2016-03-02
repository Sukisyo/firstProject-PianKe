//
//	PKHomeTodayModel.h
//
//	Create by c ma on 26/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKHomeTodayData.h"

@interface PKHomeTodayModel : NSObject

@property (nonatomic, strong) PKHomeTodayData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end