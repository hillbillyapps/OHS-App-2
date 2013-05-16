//
//  ScheduleView.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 12/18/12.
//  Copyright (c) 2012 ZACHARY FLETCHER. All rights reserved.
//

#import "ScheduleView.h"

@interface ScheduleView ()

@end

@implementation ScheduleView
@synthesize scheduleLoading;
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
    [scheduleLoading stopAnimating];
    scheduleLoading.hidden = true;
    
}
- (void)viewDidLoad
{
    [[self webView] setDelegate:self];
    [self.view addSubview: scheduleLoading];
    scheduleLoading.color = [UIColor blackColor];
    [scheduleLoading startAnimating];

    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://www.baylife.me/mobile/schedule.php"];
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

- (IBAction)reloadSchedules:(id)sender {
    scheduleLoading.hidden = false;
    [scheduleLoading startAnimating];
    NSURL *url = [NSURL URLWithString:@"http://www.baylife.me/mobile/schedule.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}
- (void)viewDidUnload {
    [self setScheduleLoading:nil];
    [super viewDidUnload];
}
@end
