//
//	PKReadModel.h
//
//	Create by c ma on 20/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>


@interface PKReadData : NSObject

@property (nonatomic, strong) NSArray * carousel;
@property (nonatomic, strong) NSArray * list;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface PKReadModel : NSObject

@property (nonatomic, strong) PKReadData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


@interface PKReadList : NSObject

@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * enname;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger typeId;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


@interface PKReadCarousel : NSObject

@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * urlid;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end



