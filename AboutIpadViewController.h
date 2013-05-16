//
//  AboutIpadViewController.h
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 2/1/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutIpadViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)AboutRefresh:(id)sender;

@end
