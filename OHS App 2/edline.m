//
//  edline.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 4/3/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "edline.h"

@interface edline ()


@end

@implementation edline
@synthesize edlineLoad;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {   
    [_loading stopAnimating];
    _loading.hidden = true;

}
- (void)viewDidLoad
{
    [[self edlineLoad] setDelegate:self];
    [self.view addSubview: _loading];
    _loading.color = [UIColor blackColor];
    [_loading startAnimating];
    [super viewDidLoad];
        self.navigationItem.title = @"Edline";
    NSURL *url = [NSURL URLWithString:@"http://www.edline.net"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [edlineLoad loadRequest:request];
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

- (void)viewDidUnload {
    [self setViewBro:nil];
   // [self setEdlineLoad:nil];
    [self setLoading:nil];
    [super viewDidUnload];
}
- (IBAction)edlineRefresh:(id)sender {
    _loading.hidden = false;
    [_loading startAnimating];
    NSURL *url = [NSURL URLWithString:@"http://www.edline.net"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [edlineLoad loadRequest:request];
}
@end
