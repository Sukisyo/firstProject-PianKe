//
//	PKReadLatestData.h
//
//	Create by c ma on 24/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKReadLatestList.h"

@interface PKReadLatestData : NSObject

@property (nonatomic, strong) NSArray * list;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end