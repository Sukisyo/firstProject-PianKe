//
//	PKGoodProductDetailCommentlist.m
//
//	Create by c ma on 21/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKGoodProductDetailCommentlist.h"

@interface PKGoodProductDetailCommentlist ()
@end
@implementation PKGoodProductDetailCommentlist




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"addtime_f"] isKindOfClass:[NSNull class]]){
        self.addtimeF = dictionary[@"addtime_f"];
    }
    if(![dictionary[@"cmtnum"] isKindOfClass:[NSNull class]]){
        self.cmtnum = [dictionary[@"cmtnum"] integerValue];
    }
    
    if(![dictionary[@"content"] isKindOfClass:[NSNull class]]){
        self.content = dictionary[@"content"];
    }
    if(![dictionary[@"contentid"] isKindOfClass:[NSNull class]]){
        self.contentid = dictionary[@"contentid"];
    }
    if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
        self.coverimg = dictionary[@"coverimg"];
    }
    if(![dictionary[@"coverimg_wh"] isKindOfClass:[NSNull class]]){
        self.coverimgWh = dictionary[@"coverimg_wh"];
    }
    if(![dictionary[@"imglist"] isKindOfClass:[NSNull class]]){
        self.imglist = dictionary[@"imglist"];
    }
    if(![dictionary[@"isdel"] isKindOfClass:[NSNull class]]){
        self.isdel = [dictionary[@"isdel"] boolValue];
    }
    
    if(![dictionary[@"islike"] isKindOfClass:[NSNull class]]){
        self.islike = [dictionary[@"islike"] boolValue];
    }
    
    if(![dictionary[@"likenum"] isKindOfClass:[NSNull class]]){
        self.likenum = [dictionary[@"likenum"] integerValue];
    }
    
    if(![dictionary[@"reuserinfo"] isKindOfClass:[NSNull class]]){
        self.reuserinfo = [[PKGoodProductDetailReuserinfo alloc] initWithDictionary:dictionary[@"reuserinfo"]];
    }
    
    if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
        self.userinfo = [[PKGoodProductDetailUserinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.addtimeF != nil){
        dictionary[@"addtime_f"] = self.addtimeF;
    }
    dictionary[@"cmtnum"] = @(self.cmtnum);
    if(self.content != nil){
        dictionary[@"content"] = self.content;
    }
    if(self.contentid != nil){
        dictionary[@"contentid"] = self.contentid;
    }
    if(self.coverimg != nil){
        dictionary[@"coverimg"] = self.coverimg;
    }
    if(self.coverimgWh != nil){
        dictionary[@"coverimg_wh"] = self.coverimgWh;
    }
    if(self.imglist != nil){
        dictionary[@"imglist"] = self.imglist;
    }
    dictionary[@"isdel"] = @(self.isdel);
    dictionary[@"islike"] = @(self.islike);
    dictionary[@"likenum"] = @(self.likenum);
    if(self.reuserinfo != nil){
        dictionary[@"reuserinfo"] = [self.reuserinfo toDictionary];
    }
    if(self.userinfo != nil){
        dictionary[@"userinfo"] = [self.userinfo toDictionary];
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if(self.addtimeF != nil){
        [aCoder encodeObject:self.addtimeF forKey:@"addtime_f"];
    }
    [aCoder encodeObject:@(self.cmtnum) forKey:@"cmtnum"];	if(self.content != nil){
        [aCoder encodeObject:self.content forKey:@"content"];
    }
    if(self.contentid != nil){
        [aCoder encodeObject:self.contentid forKey:@"contentid"];
    }
    if(self.coverimg != nil){
        [aCoder encodeObject:self.coverimg forKey:@"coverimg"];
    }
    if(self.coverimgWh != nil){
        [aCoder encodeObject:self.coverimgWh forKey:@"coverimg_wh"];
    }
    if(self.imglist != nil){
        [aCoder encodeObject:self.imglist forKey:@"imglist"];
    }
    [aCoder encodeObject:@(self.isdel) forKey:@"isdel"];	[aCoder encodeObject:@(self.islike) forKey:@"islike"];	[aCoder encodeObject:@(self.likenum) forKey:@"likenum"];	if(self.reuserinfo != nil){
        [aCoder encodeObject:self.reuserinfo forKey:@"reuserinfo"];
    }
    if(self.userinfo != nil){
        [aCoder encodeObject:self.userinfo forKey:@"userinfo"];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.addtimeF = [aDecoder decodeObjectForKey:@"addtime_f"];
    self.cmtnum = [[aDecoder decodeObjectForKey:@"cmtnum"] integerValue];
    self.content = [aDecoder decodeObjectForKey:@"content"];
    self.contentid = [aDecoder decodeObjectForKey:@"contentid"];
    self.coverimg = [aDecoder decodeObjectForKey:@"coverimg"];
    self.coverimgWh = [aDecoder decodeObjectForKey:@"coverimg_wh"];
    self.imglist = [aDecoder decodeObjectForKey:@"imglist"];
    self.isdel = [[aDecoder decodeObjectForKey:@"isdel"] boolValue];
    self.islike = [[aDecoder decodeObjectForKey:@"islike"] boolValue];
    self.likenum = [[aDecoder decodeObjectForKey:@"likenum"] integerValue];
    self.reuserinfo = [aDecoder decodeObjectForKey:@"reuserinfo"];
    self.userinfo = [aDecoder decodeObjectForKey:@"userinfo"];
    return self;
    
}
@end