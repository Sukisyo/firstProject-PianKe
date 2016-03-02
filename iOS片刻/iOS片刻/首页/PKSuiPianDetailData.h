//
//	PKSuiPianDetailData.h
//
//	Create by c ma on 25/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKSuiPianDetailCommentlist.h"
#import "PKSuiPianDetailCounterList.h"
#import "PKSuiPianDetailImglist.h"
#import "PKSuiPianDetailShareinfo.h"
#import "PKSuiPianDetailTagInfo.h"
#import "PKSuiPianDetailReuserinfo.h"

@interface PKSuiPianDetailData : NSObject

@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSArray * commentlist;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) PKSuiPianDetailCounterList * counterList;
@property (nonatomic, strong) NSString * html;
@property (nonatomic, strong) NSArray * imglist;
@property (nonatomic, assign) BOOL isfav;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, strong) PKSuiPianDetailShareinfo * shareinfo;
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) PKSuiPianDetailTagInfo * tagInfo;
@property (nonatomic, strong) PKSuiPianDetailReuserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end