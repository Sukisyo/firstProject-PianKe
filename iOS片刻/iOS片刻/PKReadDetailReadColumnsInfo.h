//
//	PKReadDetailReadColumnsInfo.h
//
//	Create by c ma on 23/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKReadDetailReadColumnsInfo : NSObject

@property (nonatomic, assign) NSInteger typeid;
@property (nonatomic, strong) NSString * typename;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end