//
//  ozark.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 2/19/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "sportsTable.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define kjsonURL [NSURL URLWithString: @"https://graph.facebook.com/445775215497913/feed?access_token=BAACEdEose0cBAATo8nXm6qYz4GEFoZCTx3V2SwAKEZB9neYGsfgj2x83wkD38D2iy7z9nqTqFS9JuJQ2iFgV2ZAsY2JZATxhikw6IVuevxTNCZC6Eq9bsdN3be7qiUwnXJIvzo2p9Vd4a0sG6viKr3ZBZBuwTFPma1IrTqj2fisQZBySPRFh5ZAxY9ZB2aW4L2FVYZD"]

@interface sportsTable ()

@end
@implementation sportsTable {
    NSMutableArray *jsonResults;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}


- (void)refresh:(UIRefreshControl *)sender {
    [NSThread detachNewThreadSelector:@selector(doRefresh:) toTarget:self withObject:sender];
}

- (void)doRefresh:(UIRefreshControl *)sender {
    //[self checkUpdate];
    // [self loadData];
    
    
    
    NSData* data = [NSData dataWithContentsOfURL:
                    
                    kjsonURL];
    
    [self performSelectorOnMainThread:@selector(fetchedData:)
     
                           withObject:data waitUntilDone:YES];
    
    
    
    [self.tableView reloadData];
    [sender endRefreshing];
    
    
}

- (void)endRefreshing {
    
}

- (void)viewDidLoad

{
   // UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
   // [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
   // [self setRefreshControl:refreshControl];
    
    NSInteger red = 125;
    NSInteger green = 38;
    NSInteger blue = 208;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0]];
    
    [super viewDidLoad];
    
    NSData* data3 = [NSData dataWithContentsOfURL:
                     
                     kjsonURL];
    if(!data3) {
        UIAlertView*aview=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Network error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil ];
        [aview show];
        return;
    }
    

    
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
    jsonResults = [json objectForKey:@"data"];
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


    
    NSString *string = [appsdict objectForKey:@"message"];
    NSRange range = [string rangeOfString:@"\n"];
    NSString *shortString = [string substringToIndex:range.location];
    NSString *shortString2 = [string substringFromIndex:range.location];
    
    
        NSRange range2 = [string rangeOfString:@":"];
        NSString *beforeSport = [string substringToIndex:range2.location];
    
    
    NSRange withoutSport = [shortString rangeOfString:@"O"];
    NSString *withoutSport2 = [shortString substringFromIndex:withoutSport.location];
    //NSString *withoutSport3 = [withoutSport2 substringToIndex:range.location];
    
    cell.textLabel.text = withoutSport2;
    cell.detailTextLabel.text = shortString2;
  
    
    if([[NSString stringWithFormat:@"%@",beforeSport] isEqualToString:@"Football"]) {
     cell.imageView.image = [UIImage imageNamed:@"Football.png"];
    }
    if([[NSString stringWithFormat:@"%@",beforeSport] isEqualToString:@"Basketball"]) {
        cell.imageView.image = [UIImage imageNamed:@"Basketball.png"];
    }
    if([[NSString stringWithFormat:@"%@",beforeSport] isEqualToString:@"Softball"]) {
        cell.imageView.image = [UIImage imageNamed:@"Softball.png"];
    }
    if([[NSString stringWithFormat:@"%@",beforeSport] isEqualToString:@"Baseball"]) {
        cell.imageView.image = [UIImage imageNamed:@"Baseball.png"];
    }
 
    return cell;
    
}

#pragma mark – Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{

    
}
- (IBAction)reloadSports:(id)sender {
    NSData* data3 = [NSData dataWithContentsOfURL:
                     
                     kjsonURL];
    if(!data3) {
        UIAlertView*aview=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Network error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil ];
        [aview show];
        return;
    }
    
    
    
    dispatch_async(kBgQueue, ^{
        
        NSData* data = [NSData dataWithContentsOfURL:
                        
                        kjsonURL];
        
        [self performSelectorOnMainThread:@selector(fetchedData:)
         
                               withObject:data waitUntilDone:YES];
        
    });

    
}

@end
