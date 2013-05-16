//
//  simpleCell.h
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 3/8/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface simpleCell : UITableViewCell
+ (simpleCell *)cell;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *detailsLabel;

@property (strong, nonatomic) IBOutlet UIImageView *imageBro;
@end
