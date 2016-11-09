//
//  LibraryAPI.h
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface LibraryAPI : NSObject

#pragma mark - Properties

@property (assign, nonatomic) BOOL flag;
+ (instancetype)sharedManager;
@property (strong, nonatomic) AFHTTPSessionManager *manager;

#pragma mark - Methods

- (NSURLSessionDataTask *)adsWithBlock:(void (^)(NSArray *posts, NSError *error))block;

@end
