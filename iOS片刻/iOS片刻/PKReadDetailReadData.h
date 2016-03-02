//
//	PKReadDetailReadData.h
//
//	Create by c ma on 23/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKReadDetailReadColumnsInfo.h"
#import "PKReadDetailReadList.h"

@interface PKReadDetailReadData : NSObject

@property (nonatomic, strong) PKReadDetailReadColumnsInfo * columnsInfo;
@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end