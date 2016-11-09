//
//  AdsTableViewCell.m
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import "AdsTableViewCell.h"
#import "Ad.h"

@implementation AdsTableViewCell

#pragma mark - Life Cycle

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Properties

- (void)setAd:(Ad *)ad {
    
    self.titleLabel.text = ad.title;
    self.createdLabel.text = ad.created;
}

@end
