//
//  adminPage.m
//  OHS App 2
//
//  Created by Hunter Harris on 6/25/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "adminPage.h"
#import "postPage.h"

@interface adminPage ()

@end

@implementation adminPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
    NSLog(@"logged in22");
}

- (void)viewDidLoad
{
    PFLogInViewController *logController = [PFLogInViewController alloc];
    logController.delegate = self;
    [super viewDidLoad];
    if ([PFUser currentUser]) {
        NSLog(@"logged in");
        [self performSegueWithIdentifier:@"loginToPostPage" sender:self];
        
    } else {

        [self.navigationController pushViewController:logController animated:YES];
        logController.fields = PFLogInFieldsUsernameAndPassword
        | PFLogInFieldsLogInButton
        | PFLogInFieldsSignUpButton
        | PFLogInFieldsDismissButton;
    }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
