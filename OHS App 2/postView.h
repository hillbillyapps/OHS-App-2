//
//  postView.h
//  OHS App 2
//
//  Created by Hunter Harris on 6/7/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface postView : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *storyText;

@property (strong, nonatomic) id detailItems;
@end
//lolol