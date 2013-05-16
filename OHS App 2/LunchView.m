//
//  LunchView.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 12/18/12.
//  Copyright (c) 2012 ZACHARY FLETCHER. All rights reserved.
//

#import "LunchView.h"

@interface LunchView ()

@end

@implementation LunchView
@synthesize lunchLoad;
@synthesize webView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [lunchLoad stopAnimating];
    lunchLoad.hidden = true;
    
}
- (void)viewDidLoad
{
    [[self webView] setDelegate:self];
    [self.view addSubview: lunchLoad];
    lunchLoad.color = [UIColor blackColor];
    [lunchLoad startAnimating];
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://www.baylife.me/mobile/lunch2.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    NSInteger red = 125;
    NSInteger green = 38;
    NSInteger blue = 208;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)lunchRefresh:(id)sender {
    lunchLoad.hidden = false;
    [lunchLoad startAnimating];
    NSURL *url = [NSURL URLWithString:@"http://www.baylife.me/mobile/lunch2.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}
- (void)viewDidUnload {
    [self setWebView:nil];
    [self setLunchLoad:nil];
    [super viewDidUnload];
}
@end
