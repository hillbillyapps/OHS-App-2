//
//  edline.h
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 4/3/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface edline : UIViewController <UIWebViewDelegate> {
    IBOutlet UIWebView *edlineLoad;
}
@property (strong, nonatomic) IBOutlet UIWebView *viewBro;
- (IBAction)edlineRefresh:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *edlineLoad;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@end
