//
//	PKReadModel.m
//
//	Create by c ma on 20/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKReadModel.h"

@interface PKReadModel ()
@end
@implementation PKReadModel


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"data"] isKindOfClass:[NSNull class]]){
		self.data = [[PKReadData alloc] initWithDictionary:dictionary[@"data"]];
	}

	if(![dictionary[@"result"] isKindOfClass:[NSNull class]]){
		self.result = [dictionary[@"result"] integerValue];
	}

	return self;
}


@end


@implementation PKReadData



-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[@"carousel"] != nil && [dictionary[@"carousel"] isKindOfClass:[NSArray class]]){
        NSArray * carouselDictionaries = dictionary[@"carousel"];
        NSMutableArray * carouselItems = [NSMutableArray array];
        for(NSDictionary * carouselDictionary in carouselDictionaries){
            PKReadCarousel * carouselItem = [[PKReadCarousel alloc] initWithDictionary:carouselDictionary];
            [carouselItems addObject:carouselItem];
        }
        self.carousel = carouselItems;
    }
    if(dictionary[@"list"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
        NSArray * listDictionaries = dictionary[@"list"];
        NSMutableArray * listItems = [NSMutableArray array];
        for(NSDictionary * listDictionary in listDictionaries){
            PKReadList * listItem = [[PKReadList alloc] initWithDictionary:listDictionary];
            [listItems addObject:listItem];
        }
        self.list = listItems;
    }
    return self;
}


@end


@implementation PKReadList


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
        self.coverimg = dictionary[@"coverimg"];
    }
    if(![dictionary[@"enname"] isKindOfClass:[NSNull class]]){
        self.enname = dictionary[@"enname"];
    }
    if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
        self.name = dictionary[@"name"];
    }
    if(![dictionary[@"type"] isKindOfClass:[NSNull class]]){
        self.typeId = [dictionary[@"type"] integerValue];
    }
    
    return self;
}

@end


@implementation PKReadCarousel



-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"img"] isKindOfClass:[NSNull class]]){
        self.img = dictionary[@"img"];
    }
    if(![dictionary[@"url"] isKindOfClass:[NSNull class]]){
        self.urlid = dictionary[@"url"];
    }
    return self;
}


@end

