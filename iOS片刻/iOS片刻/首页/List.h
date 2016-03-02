//
//	List.h
//
//	Create by c ma on 19/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "CounterList.h"
#import "TagInfo.h"
#import "Userinfo.h"

@interface List : NSObject

@property (nonatomic, assign) NSInteger addtime;
@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) CounterList * counterList;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * coverimgWh;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) TagInfo * tagInfo;
@property (nonatomic, strong) Userinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end