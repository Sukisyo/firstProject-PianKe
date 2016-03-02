//
//	PKReadLatestCounterList.h
//
//	Create by c ma on 24/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKReadLatestCounterList : NSObject

@property (nonatomic, assign) NSInteger comment;
@property (nonatomic, assign) NSInteger fav;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, assign) NSInteger view;
@property (nonatomic, assign) NSInteger vote;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end