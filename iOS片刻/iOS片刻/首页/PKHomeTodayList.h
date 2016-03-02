//
//	PKHomeTodayList.h
//
//	Create by c ma on 26/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKHomeTodayImglist.h"
#import "PKHomeTodayPlayInfo.h"
#import "PKHomeTodayPlayInfo.h"
#import "PKHomeTodayTagInfo.h"
#import "PKHomeTodayAuthorinfo.h"

@interface PKHomeTodayList : NSObject

@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * coverimgWh;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSString * enname;
@property (nonatomic, assign) NSInteger hot;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSArray * imglist;
@property (nonatomic, assign) NSInteger imgtotal;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, assign) NSInteger issend;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) PKHomeTodayPlayInfo * playInfo;
@property (nonatomic, strong) NSArray * playList;
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) PKHomeTodayTagInfo * tagInfo;
@property (nonatomic, strong) NSString * tingContentid;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) PKHomeTodayAuthorinfo * userinfo;
@property (nonatomic, assign) NSInteger view;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end