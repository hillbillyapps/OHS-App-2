//
//  ozark.h
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 2/19/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "story2.h"
#import "jsonTest.h"


NSString *posty;
NSString *dateDiff;
NSString *titley;
NSString *rowId;
NSString *fbAccessToken;
NSInteger *valueBro;
UIActivityIndicatorView *activityIndicator;
@interface ozark : UITableViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIRefreshControl *refreshControl;
- (IBAction)refreshHome:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *barItem;
@property (nonatomic) NSValue *getPostId;
@property (nonatomic) NSInteger *getId44;
@property (nonatomic) NSString *getStoryTitle;
@property (nonatomic) NSString *dateDiff;

@end
@interface UIImage (PhoenixMaster)
- (UIImage *) makeThumbnailOfSize:(CGSize)size;
@end
 