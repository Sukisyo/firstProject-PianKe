//
//	PKHomeTodayTagInfo.h
//
//	Create by c ma on 26/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKHomeTodayTagInfo : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString * tag;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end