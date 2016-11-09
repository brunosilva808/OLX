//
//  Maps.h
//  OLX
//
//  Created by Bruno Silva on 09/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Map : NSObject <NSCoding>

#pragma mark - Properties

@property (nonatomic, copy) NSString *zoom;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, assign) NSInteger radius;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *cityId;
@property (nonatomic, copy) NSString *regionId;
@property (nonatomic, copy) NSString *cityLabel;

#pragma mark - Methods

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
