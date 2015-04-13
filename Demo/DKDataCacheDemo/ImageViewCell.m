//
//  ImageViewCell.m
//  DKDataCacheDemo
//
//  Created by Daniel Khamsing on 4/13/15.
//  Copyright (c) 2015 dkhamsing. All rights reserved.
//

#import "ImageViewCell.h"

@implementation ImageViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self)
        return nil;
    
    self.photoView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.photoView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.photoView.frame = CGRectMake(0, 0, 50, 50);    
}

@end
