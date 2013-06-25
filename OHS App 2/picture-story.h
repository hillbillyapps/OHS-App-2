//
//  picture-story.h
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 4/16/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import <UIKit/UIKit.h>
UITextView *textViewA1;
UIScrollView *scroll;
NSInteger scrollHeight;
NSInteger scrollOffset;
@interface picture_story : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label22;

//@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *label33;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView* loadingView;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;



@end
