//
//  postPage.h
//  OHS App 2
//
//  Created by Hunter Harris on 6/25/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface postPage : UIViewController <PFLogInViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *postButtonOutlet;
- (IBAction)postButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *titleText;
@property (weak, nonatomic) IBOutlet UITextField *storyText;
- (IBAction)logOut:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *logOutButton;

@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@end
