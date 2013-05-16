//
//  LunchView.h
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 12/18/12.
//  Copyright (c) 2012 ZACHARY FLETCHER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LunchView : UIViewController <UIWebViewDelegate> {
    IBOutlet UIWebView *webView;
}
- (IBAction)lunchRefresh:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *lunchLoad;
@end
