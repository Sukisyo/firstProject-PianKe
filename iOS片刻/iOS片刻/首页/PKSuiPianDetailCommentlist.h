//
//	PKSuiPianDetailCommentlist.h
//
//	Create by c ma on 25/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKSuiPianDetailReuserinfo.h"
#import "PKSuiPianDetailReuserinfo.h"

@interface PKSuiPianDetailCommentlist : NSObject

@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, assign) BOOL isdel;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, assign) NSInteger likenum;
@property (nonatomic, strong) PKSuiPianDetailReuserinfo * reuserinfo;
@property (nonatomic, strong) PKSuiPianDetailReuserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end