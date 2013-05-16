//
//  iPadStory.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 4/3/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "iPadStory.h"
#import "iPadTableHome.h"
@interface iPadStory ()

@end

@implementation iPadStory

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"dddd");
    //  NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if([segue.identifier isEqualToString:@"segueOne"])
    {
        NSLog(@"dddddd");
    }
    
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    iPadTableHome *iPad = [[iPadTableHome alloc] init];
    //_realTitle = (@"%@",Ozark.getStoryTitle);
    self.navigationItem.title = iPad.getStoryTitle;
    NSURL *url = [NSURL URLWithString:[NSString
                                       stringWithFormat:@"http://www.baylife.me/mobile/story.php?post=%@",iPad.getPostId]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    
 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
