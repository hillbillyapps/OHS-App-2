//
//  nativeLunchView.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 3/12/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "nativeLunchView.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define kjsonURL [NSURL URLWithString: @"http://baylife.me/mobile/json"]
@interface nativeLunchView () {
    NSMutableArray *jsonResults;
    
}

@end

@implementation nativeLunchView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)fetchedData:(NSData *)responseData {
    
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization
                          
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          
                          error:&error];
    jsonResults = [json objectForKey:@"object_name"];
    // jsonResults = [json objectForKey:@"results"];
    

}

- (void)viewDidLoad
{
      [super viewDidLoad];
    dispatch_async(kBgQueue, ^{
        
        NSData* data2 = [NSData dataWithContentsOfURL:
                        
                        kjsonURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
         
                               withObject:data2 waitUntilDone:YES];
            });
    

       // NSDictionary *appsdict = [jsonResults data2];
    
   // textLabel.text = [appsdict objectForKey:@"title"];
   // _lolBro.text = [appsdict objectForKey:@"title"];
    
    
    
   	// Do any additional setup after loading the view.
}
                   



@end
