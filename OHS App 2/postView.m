//
//  postView.m
//  OHS App 2
//
//  Created by Hunter Harris on 6/7/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "postView.h"
#import <Parse/Parse.h>

@interface postView ()

@end

@implementation postView

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
    PFObject *postInfo = _detailItems;
    self.title = [postInfo objectForKey:@"title"];
    UITextView *storyTextView = [[UITextView alloc] initWithFrame:CGRectMake(20,50,280,100)];
       storyTextView.text = [postInfo objectForKey:@"story"];
   // float textViewHieght = storyTextView.contentSize.height;

    storyTextView.textColor = [UIColor blackColor];
    storyTextView.font = [UIFont systemFontOfSize:14];
    [storyTextView setBackgroundColor:[UIColor clearColor]];
    storyTextView.editable = NO;
    storyTextView.scrollEnabled = YES;
    [_scrollView addSubview:storyTextView];
    CGRect frame = storyTextView.frame;
    frame.size.height = storyTextView.contentSize.height;
    storyTextView.frame = frame;
    NSLog(@"frame height: %f", storyTextView.contentSize.height);
    float scrollViewContentHeight = storyTextView.contentSize.height + 50.0;
    CGRect scrollFrame;
    scrollFrame.size = _scrollView.contentSize;
    scrollFrame.size.height = scrollViewContentHeight;
    _scrollView.contentSize = scrollFrame.size;
    
    
    
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleLabel:nil];
    [self setTitleLabel:nil];
    [self setStoryText:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}
@end
