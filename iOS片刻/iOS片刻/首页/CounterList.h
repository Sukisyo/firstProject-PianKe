//
//	CounterList.h
//
//	Create by c ma on 19/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface CounterList : NSObject

@property (nonatomic, assign) NSInteger comment;
@property (nonatomic, assign) NSInteger like;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end