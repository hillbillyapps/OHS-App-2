//
//  ozark.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 2/19/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "sportsTableiPad.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define kjsonURL [NSURL URLWithString: @"http://baylife.me/mobile/json/sports.php"]

@interface sportsTableiPad ()

@end
@implementation sportsTableiPad {
    NSMutableArray *jsonResults;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}



- (void)viewDidLoad

{
  
    
    NSInteger red = 125;
    NSInteger green = 38;
    NSInteger blue = 208;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0]];
    
    [super viewDidLoad];
    
    
    dispatch_async(kBgQueue, ^{
        
        NSData* data = [NSData dataWithContentsOfURL:
                        
                        kjsonURL];
        
        [self performSelectorOnMainThread:@selector(fetchedData:)
         
                               withObject:data waitUntilDone:YES];
        
    });
    
}

- (void)fetchedData:(NSData *)responseData {
    
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization
                          
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          
                          error:&error];
    jsonResults = [json objectForKey:@"object_name"];
    // jsonResults = [json objectForKey:@"results"];
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark – Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    
    // Return the number of sections.
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    // Return the number of rows in the section.
    
    return [jsonResults count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *appsdict = [jsonResults objectAtIndex:indexPath.row];
    
    NSURL *imageURL = [NSURL URLWithString:[appsdict objectForKey:@"imagelink"]];
    
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    
    UIImage *imageLoad = [[UIImage alloc] initWithData:imageData];
    
    
    
    NSString *ozarkScore = [appsdict objectForKey:@"ozarkscore"];
    NSString *opponentScore = [appsdict objectForKey:@"opponentscore"];
    //  cell.textLabel.hi = "hoddddss";
    cell.textLabel.text = [appsdict objectForKey:@"event"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Loss - Ozark %@ Opponent %@",ozarkScore, opponentScore];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Ozark %@ Opponent %@",ozarkScore, opponentScore];
    cell.imageView.frame = CGRectMake(0, 0, 50, 50);
    cell.imageView.image = imageLoad;
    
    return cell;
    
}

#pragma mark – Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
  
    
}

@end
