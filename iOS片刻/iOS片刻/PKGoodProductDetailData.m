//
//	PKGoodProductDetailData.m
//
//	Create by c ma on 21/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKGoodProductDetailData.h"

@interface PKGoodProductDetailData ()
@end
@implementation PKGoodProductDetailData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"commentlist"] != nil && [dictionary[@"commentlist"] isKindOfClass:[NSArray class]]){
		NSArray * commentlistDictionaries = dictionary[@"commentlist"];
		NSMutableArray * commentlistItems = [NSMutableArray array];
		for(NSDictionary * commentlistDictionary in commentlistDictionaries){
			PKGoodProductDetailCommentlist * commentlistItem = [[PKGoodProductDetailCommentlist alloc] initWithDictionary:commentlistDictionary];
			[commentlistItems addObject:commentlistItem];
		}
		self.commentlist = commentlistItems;
	}
	if(![dictionary[@"commenttotal"] isKindOfClass:[NSNull class]]){
		self.commenttotal = [dictionary[@"commenttotal"] integerValue];
	}

	if(![dictionary[@"is_member"] isKindOfClass:[NSNull class]]){
		self.isMember = [dictionary[@"is_member"] integerValue];
	}

	if(![dictionary[@"postsinfo"] isKindOfClass:[NSNull class]]){
		self.postsinfo = [[PKGoodProductDetailPostsinfo alloc] initWithDictionary:dictionary[@"postsinfo"]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.commentlist != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(PKGoodProductDetailCommentlist * commentlistElement in self.commentlist){
			[dictionaryElements addObject:[commentlistElement toDictionary]];
		}
		dictionary[@"commentlist"] = dictionaryElements;
	}
	dictionary[@"commenttotal"] = @(self.commenttotal);
	dictionary[@"is_member"] = @(self.isMember);
	if(self.postsinfo != nil){
		dictionary[@"postsinfo"] = [self.postsinfo toDictionary];
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
	if(self.commentlist != nil){
		[aCoder encodeObject:self.commentlist forKey:@"commentlist"];
	}
	[aCoder encodeObject:@(self.commenttotal) forKey:@"commenttotal"];	[aCoder encodeObject:@(self.isMember) forKey:@"is_member"];	if(self.postsinfo != nil){
		[aCoder encodeObject:self.postsinfo forKey:@"postsinfo"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.commentlist = [aDecoder decodeObjectForKey:@"commentlist"];
	self.commenttotal = [[aDecoder decodeObjectForKey:@"commenttotal"] integerValue];
	self.isMember = [[aDecoder decodeObjectForKey:@"is_member"] integerValue];
	self.postsinfo = [aDecoder decodeObjectForKey:@"postsinfo"];
	return self;

}
@end