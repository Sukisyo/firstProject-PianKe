//
//	Data.h
//
//	Create by c ma on 19/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "List.h"

@interface Data : NSObject

@property (nonatomic, strong) NSArray * list;
@property (nonatomic, strong) NSObject * tagOffical;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end