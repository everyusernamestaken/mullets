//
//  ArticleCell.m
//  CVAR
//
//  Created by David Jackson on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "ArticleCell.h"

@implementation ArticleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end