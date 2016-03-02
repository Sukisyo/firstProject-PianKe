//
//	PKReadDetailReadModel.h
//
//	Create by c ma on 23/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKReadDetailReadData.h"

@interface PKReadDetailReadModel : NSObject

@property (nonatomic, strong) PKReadDetailReadData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end