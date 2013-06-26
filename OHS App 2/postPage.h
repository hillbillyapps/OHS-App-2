//
//  postPage.h
//  OHS App 2
//
//  Created by Hunter Harris on 6/25/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface postPage : UIViewController
- (IBAction)postButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *titleText;
@property (weak, nonatomic) IBOutlet UITextField *storyText;

@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@end
