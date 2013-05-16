//
//  story2.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 2/27/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "story2.h"
#import "ozark.h"

@interface story2 ()

@end

@implementation story2
@synthesize postBro33;
@synthesize idBro;
@synthesize postId = _postId;
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
    
    ozark *Ozark = [[ozark alloc] init];
    //_realTitle = (@"%@",Ozark.getStoryTitle);
    self.navigationItem.title = Ozark.getStoryTitle;
    NSURL *url = [NSURL URLWithString:[NSString
                stringWithFormat:@"http://www.baylife.me/mobile/story.php?post=%@",Ozark.getPostId]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
  
    
  //  NSLog(@"Ozark.valueBro: %i",*Ozark.valueBro);
  //  NSLog(@"test:%@", Ozark.getPostId);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    [super viewDidUnload];
}
@end
