//
//  storypage.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 4/8/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "storypage.h"
#import "ozark.h"
#define kBgQueue2 dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define kjsonURL2 [NSURL URLWithString: @"https://graph.facebook.com/142919315888548/feed?access_token=BAACEdEose0cBABU0PXay1XA0H9ZBOO5cEFATGabYgZCJgG1bBe2plLe88eXpWxgFrzdNQCd2yEIyJ1mZBcncPitn8AcfbjdY9ZCfH0v8kSZB8WffZC6TdxNoe0csGLqK16p4s2lEPKzLbKVdjtxAYEH0NRgaI9DFEZBmsvDJAK51tsUnHdEGppbvbNZBDmWRRQMZD"]

@interface storypage ()

@end

@implementation storypage {
NSMutableArray *jsonResults;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)fetchedData:(NSData *)responseData {
    
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization
                          
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          
                          error:&error];
    jsonResults = [json objectForKey:@"data"];
    
    ozark *Ozark = [[ozark alloc] init];    
    [_loading stopAnimating];
    _loading.hidden = true;
    
    NSDictionary *appsdict = [jsonResults objectAtIndex:Ozark.getId44];
    NSString *string = [appsdict objectForKey:@"message"];
    NSRange range = [string rangeOfString:@"\n"];
    NSString *shortString = [string substringToIndex:range.location];
    NSString *shortString2 = [string substringFromIndex:range.location];

    _label33.text = shortString2;
    
//    CGRect frame = _label33.frame;
//    frame.size.height = _label33.contentSize.height;
//    _label33.frame = frame;
   // [self.scroll addSubview: _label33];
    
   // _label33.text = shortString2;
    _label22.text = shortString;
    self.navigationItem.title = shortString;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview: _loading];
        //UIScrollView *scroll = (UIScrollView *)self.view;
        //_scroll.contentSize = CGSizeMake(self.view.frame.size.width, 600);
    _loading.color = [UIColor blackColor];
    [_loading startAnimating];


   dispatch_async(kBgQueue2, ^{
        
        NSData* data = [NSData dataWithContentsOfURL:
                        
                        kjsonURL2];
        
        [self performSelectorOnMainThread:@selector(fetchedData:)
         
                              withObject:data waitUntilDone:YES];
        
    });
 
}


- (void)updatingTheGUI {
    [self loadView];
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitle:nil];


     [self setLabel22:nil];
    [self setLabel33:nil];
    [self setLoading:nil];
    //[self setScroll:nil];
    [self setLabel22:nil];
    [super viewDidUnload];
}
@end
