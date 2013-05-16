//
//  jsontest.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 2/19/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "jsontest.h"

@interface jsontest ()

@end

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define kjsonURL [NSURL URLWithString: @"http://itunes.apple.com/search?term=neil%20north&entity=software&attribute=softwareDeveloper&country=us"]

//ivar

NSMutableArray *jsonResults;


@implementation jsontest

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
