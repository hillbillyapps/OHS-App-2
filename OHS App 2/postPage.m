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
        // Custom initialization
    }
    return self;
}


- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
    NSLog(@"logged in22");
}

 
- (void)viewDidLoad
{
   // self.navigationController.title = @"Post a new story";
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewDidUnload {
    [self setUserLabel:nil];
    [self setTitleText:nil];
    [self setStoryText:nil];
    [super viewDidUnload];
}
- (IBAction)postButton:(id)sender {

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
 

}
@end
