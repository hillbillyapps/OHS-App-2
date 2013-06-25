//
//  picture-story.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 4/16/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "picture-story.h"
#import "jsonTest.h"
#import "ozark.h"

#define kBgQueue2 dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define kjsonURL2 [NSURL URLWithString: @"https://graph.facebook.com/142919315888548/feed?access_token=BAACEdEose0cBABU0PXay1XA0H9ZBOO5cEFATGabYgZCJgG1bBe2plLe88eXpWxgFrzdNQCd2yEIyJ1mZBcncPitn8AcfbjdY9ZCfH0v8kSZB8WffZC6TdxNoe0csGLqK16p4s2lEPKzLbKVdjtxAYEH0NRgaI9DFEZBmsvDJAK51tsUnHdEGppbvbNZBDmWRRQMZD"]

@interface picture_story ()

@end
//@interface _scrollView : UIView <UIScrollViewDelegate> {
//
//}
//@end
@implementation picture_story {
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
    
    
    NSDictionary *appsdict = [jsonResults objectAtIndex:Ozark.getId44];
    [_loading stopAnimating];
    _loading.hidden = true;
    NSString *string = [appsdict objectForKey:@"message"];
    NSRange range = [string rangeOfString:@"\n"];
    NSString *shortString = [string substringToIndex:range.location];
    NSString *shortString2 = [string substringFromIndex:range.location];
    
    
    
    NSString *objectId33 = [appsdict objectForKey:@"object_id"];
    NSString *highQual = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=normal",objectId33];
    NSURL *highQual2 = [NSURL URLWithString:highQual];
    NSData *imageData = [NSData dataWithContentsOfURL:highQual2];
    UIImage *imageLoad = [[UIImage alloc] initWithData:imageData];
    
    CGSize mySize = [imageLoad size];
    //    NSLog(@"Height:%f Width:%f",mySize.height,mySize.width);
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    if (screenHeight == 480){
        scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,320,480)];
    }
    else {
     scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,320,480)];
    }
    scroll.contentSize = CGSizeMake(320, 800);
    [self.view addSubview:scroll];
    
    CGFloat aspectRatio = mySize.width / mySize.height;
    NSInteger d = 40;
    NSInteger w = aspectRatio*130;
    NSInteger height = 250/aspectRatio;
    NSLog(@"image hieght in view:%i",height);
    

    UIImageView *imgView;
    NSInteger textViewY = 183;
    
    CGPoint superCenter;
    
    
    if (height > 450) {
        height = 450;
    }
    if(w > 300) {
        w = 300;
    }
    NSInteger centerHeight = 50+height/2;
    
    if (aspectRatio > 1.2) {
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, d, w, 130)]; //x,y,height,width
        superCenter = CGPointMake(160, 115);
    } else {
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, d, 250, height)]; //x,y,height,width
        superCenter = CGPointMake(160, centerHeight);
        textViewY = 53+height;
    }
    scrollHeight = textViewY + 485;
    scroll.contentSize = CGSizeMake(320, scrollHeight);
    NSLog(@"Scrollview content size:%@",NSStringFromCGSize(scroll.contentSize));
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,20,280,30)];
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18.0]];
    titleLabel.text = shortString;
    titleLabel.textAlignment = UITextAlignmentCenter;
    

    
    if(screenHeight > 480) {
        textViewA1 = [[UITextView alloc] initWithFrame:CGRectMake(20, textViewY, 281, 460)];
    } else { //iphone 4
        textViewA1 = [[UITextView alloc] initWithFrame:CGRectMake(20, textViewY, 281, 372)];
    }
    [textViewA1 setScrollEnabled: false];
    
    [textViewA1 setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    //[textViewA1 setScrollEnabled:NO];
    textViewA1.editable = false;
    textViewA1.bounces = false;
    [textViewA1 setUserInteractionEnabled:YES];
    [textViewA1 setBackgroundColor:[UIColor clearColor]];
    [textViewA1 setShowsVerticalScrollIndicator:false];
    //[textViewA1 sizeToFit];
    textViewA1.text = shortString2;
    
    CGRect frame = textViewA1.frame;
    frame.size.height = textViewA1.contentSize.height;
    textViewA1.frame = frame;
    //[self.scrollView addSubview: textViewA1];
    // [self.view addSubview: imgView];
    [imgView setCenter:superCenter];
    _label22.text = shortString;
    scrollOffset = scrollHeight - 480;
    NSLog(@"Scrolloffset:%i",scrollOffset);
    imgView.image = imageLoad;
    self.navigationItem.title = shortString;
    [scroll addSubview:imgView];
    [scroll addSubview:titleLabel];
    [scroll addSubview:textViewA1];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview: _loading];
    _loading.color = [UIColor blackColor];
    [_loading startAnimating];
    dispatch_async(kBgQueue2, ^{
        
        NSData* data = [NSData dataWithContentsOfURL:
                        
                        kjsonURL2];
        
        
        
        [self performSelectorOnMainThread:@selector(fetchedData:)
         
                               withObject:data waitUntilDone:YES];
        _loading.hidesWhenStopped = true;
        
        scroll.delegate = self;
        
        
    });
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scroll{
    NSLog(@"%f", scroll.contentOffset.y);
    if (scroll.contentOffset.y == scrollOffset) {
       // [scroll setScrollEnabled: false];
        [textViewA1 setScrollEnabled: true];}
    else if (scroll.contentOffset.y < scrollOffset) {
        [textViewA1 setScrollEnabled: false];
       // [scroll setScrollEnabled: true];
    }
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
    //[self setImageView:nil];
    [self setLabel33:nil];
    [self setLoading:nil];
    [self setScrollView:nil];
    [self setLoading:nil];
    [self setLabel22:nil];
    [super viewDidUnload];
}
@end
