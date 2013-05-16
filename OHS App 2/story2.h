//
//  story2.h
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 2/27/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ozark.h"
//NSString *postBro33;
@interface story2 : UIViewController {
    NSNumber *postBro33;
    NSValue *idBro;
    NSValue *postId;
    
}
   //NSString *postStory;

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property NSNumber *postBro33;
@property NSValue *idBro;
@property NSValue *postId;
@property NSString *realTitle;
@end
 