//
//  Ads.h
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//


#import <Mantle/Mantle.h>

@interface Ad : MTLModel <MTLJSONSerializing, NSCoding>

#pragma mark - Properties

@property (nonatomic, copy) NSString *guid;
@property (nonatomic, copy) NSURL *url;
@property (nonatomic, copy) NSURL *previewUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *created;
//@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *adDescription;
//@property (nonatomic, assign) BOOL hilighted;

#pragma mark - Methods

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
