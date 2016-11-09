//
//  ParseManager.h
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersistentManager : NSObject

#pragma mark - Methods

- (void)saveAds:(NSMutableArray *)ads;
- (NSMutableArray *)loadAds;

@end
