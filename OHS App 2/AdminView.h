//
//  AdminView.h
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 12/18/12.
//  Copyright (c) 2012 ZACHARY FLETCHER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminView : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)refreshAdmin:(id)sender;
@end
