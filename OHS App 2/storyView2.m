//
//  OHS2-ipadViewController.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 1/29/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "OHS2-ipadViewController.h"

@interface OHS2_ipadViewController ()

@end

@implementation OHS2_ipadViewController

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
    NSURL *url = [NSURL URLWithString:@"http://www.baylife.me/mobile/story.php?id="];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
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

- (IBAction)HomeBack:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.baylife.me/mobile"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}
@end
