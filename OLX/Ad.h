//
//  Ads.h
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Map;

@interface Ad : NSObject <NSCoding>

#pragma mark - Properties

@property (nonatomic, copy) NSString *guid;
@property (nonatomic, copy) NSURL *url;
@property (nonatomic, copy) NSURL *previewUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, copy) NSString *adDescription;
@property (nonatomic, strong) Map *map;
@property (nonatomic, copy) NSString *price;

#pragma mark - Methods

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
