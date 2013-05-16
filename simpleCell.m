//
//  simpleCell.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 3/8/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "simpleCell.h"

@implementation simpleCell

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
