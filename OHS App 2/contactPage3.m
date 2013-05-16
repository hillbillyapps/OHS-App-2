//
//  contactPage3.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 4/30/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "contactPage3.h"

@interface contactPage3 ()

@end

@implementation contactPage3

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)callKind:(id)sender {
    NSString *phoneNumber = @"telprompt://14796673021";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (IBAction)callLower {
    NSString *phoneNumber = @"telprompt://14796674745";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (IBAction)callUpper {
    NSString *phoneNumber = @"telprompt://14796673464";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (IBAction)callMiddle {
    NSString *phoneNumber = @"telprompt://14794686111";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (IBAction)callJrHigh {
    NSString *phoneNumber = @"telprompt://14796674747";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (IBAction)callHighSchool {
    NSString *phoneNumber = @"telprompt://14796674116";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (IBAction)callSuper {
    NSString *phoneNumber = @"telprompt://14796674118";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}


@end
