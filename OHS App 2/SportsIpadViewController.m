//
//  SportsIpadViewController.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 1/30/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "SportsIpadViewController.h"

@interface SportsIpadViewController ()

@end

@implementation SportsIpadViewController

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
    NSURL *url = [NSURL URLWithString:@"http://www.baylife.me/mobile/sports.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];// Do any additional setup after loading the view.
    NSInteger red = 160;
    NSInteger green = 92;
    NSInteger blue = 240;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
