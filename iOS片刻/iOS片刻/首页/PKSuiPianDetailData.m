//
//	PKSuiPianDetailData.m
//
//	Create by c ma on 25/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKSuiPianDetailData.h"

@interface PKSuiPianDetailData ()
@end
@implementation PKSuiPianDetailData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"addtime_f"] isKindOfClass:[NSNull class]]){
		self.addtimeF = dictionary[@"addtime_f"];
	}	
	if(dictionary[@"commentlist"] != nil && [dictionary[@"commentlist"] isKindOfClass:[NSArray class]]){
		NSArray * commentlistDictionaries = dictionary[@"commentlist"];
		NSMutableArray * commentlistItems = [NSMutableArray array];
		for(NSDictionary * commentlistDictionary in commentlistDictionaries){
			PKSuiPianDetailCommentlist * commentlistItem = [[PKSuiPianDetailCommentlist alloc] initWithDictionary:commentlistDictionary];
			[commentlistItems addObject:commentlistItem];
		}
		self.commentlist = commentlistItems;
	}
	if(![dictionary[@"contentid"] isKindOfClass:[NSNull class]]){
		self.contentid = dictionary[@"contentid"];
	}	
	if(![dictionary[@"counterList"] isKindOfClass:[NSNull class]]){
		self.counterList = [[PKSuiPianDetailCounterList alloc] initWithDictionary:dictionary[@"counterList"]];
	}

	if(![dictionary[@"html"] isKindOfClass:[NSNull class]]){
		self.html = dictionary[@"html"];
	}	
	if(dictionary[@"imglist"] != nil && [dictionary[@"imglist"] isKindOfClass:[NSArray class]]){
		NSArray * imglistDictionaries = dictionary[@"imglist"];
		NSMutableArray * imglistItems = [NSMutableArray array];
		for(NSDictionary * imglistDictionary in imglistDictionaries){
			PKSuiPianDetailImglist * imglistItem = [[PKSuiPianDetailImglist alloc] initWithDictionary:imglistDictionary];
			[imglistItems addObject:imglistItem];
		}
		self.imglist = imglistItems;
	}
	if(![dictionary[@"isfav"] isKindOfClass:[NSNull class]]){
		self.isfav = [dictionary[@"isfav"] boolValue];
	}

	if(![dictionary[@"islike"] isKindOfClass:[NSNull class]]){
		self.islike = [dictionary[@"islike"] boolValue];
	}

	if(![dictionary[@"shareinfo"] isKindOfClass:[NSNull class]]){
		self.shareinfo = [[PKSuiPianDetailShareinfo alloc] initWithDictionary:dictionary[@"shareinfo"]];
	}

	if(![dictionary[@"songid"] isKindOfClass:[NSNull class]]){
		self.songid = dictionary[@"songid"];
	}	
	if(![dictionary[@"tag_info"] isKindOfClass:[NSNull class]]){
		self.tagInfo = [[PKSuiPianDetailTagInfo alloc] initWithDictionary:dictionary[@"tag_info"]];
	}

	if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
		self.userinfo = [[PKSuiPianDetailReuserinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
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
	if(self.commentlist != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(PKSuiPianDetailCommentlist * commentlistElement in self.commentlist){
			[dictionaryElements addObject:[commentlistElement toDictionary]];
		}
		dictionary[@"commentlist"] = dictionaryElements;
	}
	if(self.contentid != nil){
		dictionary[@"contentid"] = self.contentid;
	}
	if(self.counterList != nil){
		dictionary[@"counterList"] = [self.counterList toDictionary];
	}
	if(self.html != nil){
		dictionary[@"html"] = self.html;
	}
	if(self.imglist != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(PKSuiPianDetailImglist * imglistElement in self.imglist){
			[dictionaryElements addObject:[imglistElement toDictionary]];
		}
		dictionary[@"imglist"] = dictionaryElements;
	}
	dictionary[@"isfav"] = @(self.isfav);
	dictionary[@"islike"] = @(self.islike);
	if(self.shareinfo != nil){
		dictionary[@"shareinfo"] = [self.shareinfo toDictionary];
	}
	if(self.songid != nil){
		dictionary[@"songid"] = self.songid;
	}
	if(self.tagInfo != nil){
		dictionary[@"tag_info"] = [self.tagInfo toDictionary];
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
	if(self.commentlist != nil){
		[aCoder encodeObject:self.commentlist forKey:@"commentlist"];
	}
	if(self.contentid != nil){
		[aCoder encodeObject:self.contentid forKey:@"contentid"];
	}
	if(self.counterList != nil){
		[aCoder encodeObject:self.counterList forKey:@"counterList"];
	}
	if(self.html != nil){
		[aCoder encodeObject:self.html forKey:@"html"];
	}
	if(self.imglist != nil){
		[aCoder encodeObject:self.imglist forKey:@"imglist"];
	}
	[aCoder encodeObject:@(self.isfav) forKey:@"isfav"];	[aCoder encodeObject:@(self.islike) forKey:@"islike"];	if(self.shareinfo != nil){
		[aCoder encodeObject:self.shareinfo forKey:@"shareinfo"];
	}
	if(self.songid != nil){
		[aCoder encodeObject:self.songid forKey:@"songid"];
	}
	if(self.tagInfo != nil){
		[aCoder encodeObject:self.tagInfo forKey:@"tag_info"];
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
	self.commentlist = [aDecoder decodeObjectForKey:@"commentlist"];
	self.contentid = [aDecoder decodeObjectForKey:@"contentid"];
	self.counterList = [aDecoder decodeObjectForKey:@"counterList"];
	self.html = [aDecoder decodeObjectForKey:@"html"];
	self.imglist = [aDecoder decodeObjectForKey:@"imglist"];
	self.isfav = [[aDecoder decodeObjectForKey:@"isfav"] boolValue];
	self.islike = [[aDecoder decodeObjectForKey:@"islike"] boolValue];
	self.shareinfo = [aDecoder decodeObjectForKey:@"shareinfo"];
	self.songid = [aDecoder decodeObjectForKey:@"songid"];
	self.tagInfo = [aDecoder decodeObjectForKey:@"tag_info"];
	self.userinfo = [aDecoder decodeObjectForKey:@"userinfo"];
	return self;

}
@end