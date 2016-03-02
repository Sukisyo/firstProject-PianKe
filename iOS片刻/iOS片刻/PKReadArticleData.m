//
//	PKReadArticleData.m
//
//	Create by c ma on 24/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKReadArticleData.h"

@interface PKReadArticleData ()
@end
@implementation PKReadArticleData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"contentid"] isKindOfClass:[NSNull class]]){
		self.contentid = dictionary[@"contentid"];
	}	
	if(![dictionary[@"counterList"] isKindOfClass:[NSNull class]]){
		self.counterList = [[PKReadArticleCounterList alloc] initWithDictionary:dictionary[@"counterList"]];
	}

	if(![dictionary[@"html"] isKindOfClass:[NSNull class]]){
		self.html = dictionary[@"html"];
	}	
	if(![dictionary[@"imglist"] isKindOfClass:[NSNull class]]){
		self.imglist = dictionary[@"imglist"];
	}	
	if(![dictionary[@"isfav"] isKindOfClass:[NSNull class]]){
		self.isfav = [dictionary[@"isfav"] boolValue];
	}

	if(![dictionary[@"islike"] isKindOfClass:[NSNull class]]){
		self.islike = [dictionary[@"islike"] boolValue];
	}

	if(![dictionary[@"shareinfo"] isKindOfClass:[NSNull class]]){
		self.shareinfo = [[PKReadArticleShareinfo alloc] initWithDictionary:dictionary[@"shareinfo"]];
	}

	if(![dictionary[@"songid"] isKindOfClass:[NSNull class]]){
		self.songid = dictionary[@"songid"];
	}	
	if(![dictionary[@"tingInfo"] isKindOfClass:[NSNull class]]){
		self.tingInfo = [[PKReadArticleTingInfo alloc] initWithDictionary:dictionary[@"tingInfo"]];
	}

	if(![dictionary[@"topicInfo"] isKindOfClass:[NSNull class]]){
		self.topicInfo = [[PKReadArticleTingInfo alloc] initWithDictionary:dictionary[@"topicInfo"]];
	}

	if(![dictionary[@"typeid"] isKindOfClass:[NSNull class]]){
		self.typeid = [dictionary[@"typeid"] integerValue];
	}

	if(![dictionary[@"typename"] isKindOfClass:[NSNull class]]){
		self.typename = dictionary[@"typename"];
	}	
	if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
		self.userinfo = [[PKReadArticleUserinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
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
		dictionary[@"imglist"] = self.imglist;
	}
	dictionary[@"isfav"] = @(self.isfav);
	dictionary[@"islike"] = @(self.islike);
	if(self.shareinfo != nil){
		dictionary[@"shareinfo"] = [self.shareinfo toDictionary];
	}
	if(self.songid != nil){
		dictionary[@"songid"] = self.songid;
	}
	if(self.tingInfo != nil){
		dictionary[@"tingInfo"] = [self.tingInfo toDictionary];
	}
	if(self.topicInfo != nil){
		dictionary[@"topicInfo"] = [self.topicInfo toDictionary];
	}
	dictionary[@"typeid"] = @(self.typeid);
	if(self.typename != nil){
		dictionary[@"typename"] = self.typename;
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
	if(self.tingInfo != nil){
		[aCoder encodeObject:self.tingInfo forKey:@"tingInfo"];
	}
	if(self.topicInfo != nil){
		[aCoder encodeObject:self.topicInfo forKey:@"topicInfo"];
	}
	[aCoder encodeObject:@(self.typeid) forKey:@"typeid"];	if(self.typename != nil){
		[aCoder encodeObject:self.typename forKey:@"typename"];
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
	self.contentid = [aDecoder decodeObjectForKey:@"contentid"];
	self.counterList = [aDecoder decodeObjectForKey:@"counterList"];
	self.html = [aDecoder decodeObjectForKey:@"html"];
	self.imglist = [aDecoder decodeObjectForKey:@"imglist"];
	self.isfav = [[aDecoder decodeObjectForKey:@"isfav"] boolValue];
	self.islike = [[aDecoder decodeObjectForKey:@"islike"] boolValue];
	self.shareinfo = [aDecoder decodeObjectForKey:@"shareinfo"];
	self.songid = [aDecoder decodeObjectForKey:@"songid"];
	self.tingInfo = [aDecoder decodeObjectForKey:@"tingInfo"];
	self.topicInfo = [aDecoder decodeObjectForKey:@"topicInfo"];
	self.typeid = [[aDecoder decodeObjectForKey:@"typeid"] integerValue];
	self.typename = [aDecoder decodeObjectForKey:@"typename"];
	self.userinfo = [aDecoder decodeObjectForKey:@"userinfo"];
	return self;

}
@end