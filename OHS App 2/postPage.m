//
//  postPage.m
//  OHS App 2
//
//  Created by Hunter Harris on 6/25/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "postPage.h"

@interface postPage ()

@end

@implementation postPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self.navigationController popViewControllerAnimated:YES];
   // [self dismissViewControllerAnimated:YES completion:NULL];
    [self viewDidLoad];
    NSLog(@"logged in22");
    [self.logOutButton isEnabled];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.titleText resignFirstResponder];
    [self.storyText resignFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"Appeared");
    if ([PFUser currentUser] != nil) {
        [self.view addSubview:_titleText];
        [self.view addSubview:_storyText];
        [self.view addSubview:_postButtonOutlet];
    } else {
        _userLabel.text = @"Logged out";
        [self.titleText removeFromSuperview];
        [self.storyText removeFromSuperview];
        [self.postButtonOutlet removeFromSuperview];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([PFUser currentUser]) {
        _userLabel.text = [NSString stringWithFormat:@"%@",[PFUser currentUser].username];
    } else {
        
        PFLogInViewController *logController = [PFLogInViewController alloc];
        logController.delegate = self;
        
        [self.navigationController pushViewController:logController animated:YES];
        logController.fields = PFLogInFieldsUsernameAndPassword
        | PFLogInFieldsLogInButton
        | PFLogInFieldsSignUpButton
        | PFLogInFieldsDismissButton;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (void)viewDidUnload {
    [self setUserLabel:nil];
    [self setTitleText:nil];
    [self setStoryText:nil];
    [self setLogOutButton:nil];
    [self setPostButtonOutlet:nil];
    [super viewDidUnload];
}
- (IBAction)postButton:(id)sender {
    if ([PFUser currentUser] != nil) {
    PFObject *stories = [PFObject objectWithClassName:@"stories"];
    if (![_titleText.text isEqualToString:@""] && ![_storyText.text isEqualToString:@""]) {
    [stories setObject:_titleText.text forKey:@"title"];
    [stories setObject:_storyText.text forKey:@"story"];
    [stories saveInBackground];
        UIAlertView*aview=[[UIAlertView alloc]initWithTitle:@"Story posted" message:@"The story has been posted." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil ];
        [aview show];
        _titleText.text = @"";
        _storyText.text = @"";
        return;
    } else {
        UIAlertView*aview2=[[UIAlertView alloc]initWithTitle:@"Error" message:@"The story must have a title and details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil ];
        [aview2 show];
        return;
    }
    } else if ([PFUser currentUser] == nil) {
        UIAlertView*aview2=[[UIAlertView alloc]initWithTitle:@"Error" message:@"You must log in to post" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil ];
        [aview2 show];
        return;

    }
}
- (IBAction)logOut:(id)sender {
    [PFUser logOut];
    PFLogInViewController *logController = [PFLogInViewController alloc];
    logController.delegate = self;
    logController.fields = PFLogInFieldsUsernameAndPassword
    | PFLogInFieldsLogInButton
    | PFLogInFieldsSignUpButton
    | PFLogInFieldsDismissButton;
    [self.navigationController pushViewController:logController animated:YES];

    NSLog(@"logged out");
}
@end
