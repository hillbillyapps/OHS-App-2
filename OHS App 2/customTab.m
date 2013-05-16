//
//  customTab.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 2/15/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "customTab.h"

@interface customTab ()

@end

@implementation customTab

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
    NSInteger red = 125;
    NSInteger green = 38;
    NSInteger blue = 208;
    self.moreNavigationController.navigationBar.tintColor = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0];
     
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
