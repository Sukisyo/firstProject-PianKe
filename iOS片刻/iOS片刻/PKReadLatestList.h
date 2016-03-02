//
//	PKReadLatestList.h
//
//	Create by c ma on 24/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKReadLatestCounterList.h"
#import "PKReadLatestUserinfo.h"

@interface PKReadLatestList : NSObject

@property (nonatomic, assign) NSInteger addtime;
@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) PKReadLatestCounterList * counterList;
@property (nonatomic, strong) NSString * firstimage;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, strong) NSString * shortcontent;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) PKReadLatestUserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end