//
//	PKHomeTodayPlayInfo.m
//
//	Create by c ma on 26/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKHomeTodayPlayInfo.h"

@interface PKHomeTodayPlayInfo ()
@end
@implementation PKHomeTodayPlayInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"authorinfo"] isKindOfClass:[NSNull class]]){
		self.authorinfo = [[PKHomeTodayAuthorinfo alloc] initWithDictionary:dictionary[@"authorinfo"]];
	}

	if(![dictionary[@"imgUrl"] isKindOfClass:[NSNull class]]){
		self.imgUrl = dictionary[@"imgUrl"];
	}	
	if(![dictionary[@"musicUrl"] isKindOfClass:[NSNull class]]){
		self.musicUrl = dictionary[@"musicUrl"];
	}	
	if(![dictionary[@"shareinfo"] isKindOfClass:[NSNull class]]){
		self.shareinfo = [[PKHomeTodayShareinfo alloc] initWithDictionary:dictionary[@"shareinfo"]];
	}

	if(![dictionary[@"sharepic"] isKindOfClass:[NSNull class]]){
		self.sharepic = dictionary[@"sharepic"];
	}	
	if(![dictionary[@"sharetext"] isKindOfClass:[NSNull class]]){
		self.sharetext = dictionary[@"sharetext"];
	}	
	if(![dictionary[@"shareurl"] isKindOfClass:[NSNull class]]){
		self.shareurl = dictionary[@"shareurl"];
	}	
	if(![dictionary[@"ting_contentid"] isKindOfClass:[NSNull class]]){
		self.tingContentid = dictionary[@"ting_contentid"];
	}	
	if(![dictionary[@"tingid"] isKindOfClass:[NSNull class]]){
		self.tingid = dictionary[@"tingid"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
		self.userinfo = [[PKHomeTodayAuthorinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
	}

	if(![dictionary[@"webview_url"] isKindOfClass:[NSNull class]]){
		self.webviewUrl = dictionary[@"webview_url"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.authorinfo != nil){
		dictionary[@"authorinfo"] = [self.authorinfo toDictionary];
	}
	if(self.imgUrl != nil){
		dictionary[@"imgUrl"] = self.imgUrl;
	}
	if(self.musicUrl != nil){
		dictionary[@"musicUrl"] = self.musicUrl;
	}
	if(self.shareinfo != nil){
		dictionary[@"shareinfo"] = [self.shareinfo toDictionary];
	}
	if(self.sharepic != nil){
		dictionary[@"sharepic"] = self.sharepic;
	}
	if(self.sharetext != nil){
		dictionary[@"sharetext"] = self.sharetext;
	}
	if(self.shareurl != nil){
		dictionary[@"shareurl"] = self.shareurl;
	}
	if(self.tingContentid != nil){
		dictionary[@"ting_contentid"] = self.tingContentid;
	}
	if(self.tingid != nil){
		dictionary[@"tingid"] = self.tingid;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
	if(self.userinfo != nil){
		dictionary[@"userinfo"] = [self.userinfo toDictionary];
	}
	if(self.webviewUrl != nil){
		dictionary[@"webview_url"] = self.webviewUrl;
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
	if(self.authorinfo != nil){
		[aCoder encodeObject:self.authorinfo forKey:@"authorinfo"];
	}
	if(self.imgUrl != nil){
		[aCoder encodeObject:self.imgUrl forKey:@"imgUrl"];
	}
	if(self.musicUrl != nil){
		[aCoder encodeObject:self.musicUrl forKey:@"musicUrl"];
	}
	if(self.shareinfo != nil){
		[aCoder encodeObject:self.shareinfo forKey:@"shareinfo"];
	}
	if(self.sharepic != nil){
		[aCoder encodeObject:self.sharepic forKey:@"sharepic"];
	}
	if(self.sharetext != nil){
		[aCoder encodeObject:self.sharetext forKey:@"sharetext"];
	}
	if(self.shareurl != nil){
		[aCoder encodeObject:self.shareurl forKey:@"shareurl"];
	}
	if(self.tingContentid != nil){
		[aCoder encodeObject:self.tingContentid forKey:@"ting_contentid"];
	}
	if(self.tingid != nil){
		[aCoder encodeObject:self.tingid forKey:@"tingid"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	if(self.userinfo != nil){
		[aCoder encodeObject:self.userinfo forKey:@"userinfo"];
	}
	if(self.webviewUrl != nil){
		[aCoder encodeObject:self.webviewUrl forKey:@"webview_url"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.authorinfo = [aDecoder decodeObjectForKey:@"authorinfo"];
	self.imgUrl = [aDecoder decodeObjectForKey:@"imgUrl"];
	self.musicUrl = [aDecoder decodeObjectForKey:@"musicUrl"];
	self.shareinfo = [aDecoder decodeObjectForKey:@"shareinfo"];
	self.sharepic = [aDecoder decodeObjectForKey:@"sharepic"];
	self.sharetext = [aDecoder decodeObjectForKey:@"sharetext"];
	self.shareurl = [aDecoder decodeObjectForKey:@"shareurl"];
	self.tingContentid = [aDecoder decodeObjectForKey:@"ting_contentid"];
	self.tingid = [aDecoder decodeObjectForKey:@"tingid"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.userinfo = [aDecoder decodeObjectForKey:@"userinfo"];
	self.webviewUrl = [aDecoder decodeObjectForKey:@"webview_url"];
	return self;

}
@end