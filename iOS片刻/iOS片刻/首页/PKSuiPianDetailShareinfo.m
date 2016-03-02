//
//	PKSuiPianDetailShareinfo.m
//
//	Create by c ma on 25/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKSuiPianDetailShareinfo.h"

@interface PKSuiPianDetailShareinfo ()
@end
@implementation PKSuiPianDetailShareinfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"pic"] isKindOfClass:[NSNull class]]){
		self.pic = dictionary[@"pic"];
	}	
	if(![dictionary[@"text"] isKindOfClass:[NSNull class]]){
		self.text = dictionary[@"text"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"url"] isKindOfClass:[NSNull class]]){
		self.url = dictionary[@"url"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.pic != nil){
		dictionary[@"pic"] = self.pic;
	}
	if(self.text != nil){
		dictionary[@"text"] = self.text;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
	if(self.url != nil){
		dictionary[@"url"] = self.url;
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
	if(self.pic != nil){
		[aCoder encodeObject:self.pic forKey:@"pic"];
	}
	if(self.text != nil){
		[aCoder encodeObject:self.text forKey:@"text"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:@"url"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.pic = [aDecoder decodeObjectForKey:@"pic"];
	self.text = [aDecoder decodeObjectForKey:@"text"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.url = [aDecoder decodeObjectForKey:@"url"];
	return self;

}
@end