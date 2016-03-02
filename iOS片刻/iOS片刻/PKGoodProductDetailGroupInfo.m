//
//	PKGoodProductDetailGroupInfo.m
//
//	Create by c ma on 21/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKGoodProductDetailGroupInfo.h"

@interface PKGoodProductDetailGroupInfo ()
@end
@implementation PKGoodProductDetailGroupInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"groupid"] isKindOfClass:[NSNull class]]){
		self.groupid = dictionary[@"groupid"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.groupid != nil){
		dictionary[@"groupid"] = self.groupid;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
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
	if(self.groupid != nil){
		[aCoder encodeObject:self.groupid forKey:@"groupid"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.groupid = [aDecoder decodeObjectForKey:@"groupid"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	return self;

}
@end