//
//  SchedulesIpadViewController.h
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 1/30/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchedulesIpadViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)ScheduleRefresh:(id)sender;

@end
