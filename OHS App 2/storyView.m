//
//  ozark.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 2/19/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "storyView.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define kjsonURL [NSURL URLWithString: @"http://baylife.me/mobile/json/story.php?id=298"]

@interface storyView ()
@end
@implementation storyView{
    
    
    NSMutableArray *jsonResults;
    
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)refreshView:(UIRefreshControl *)sender {
    // Do something...
    [sender endRefreshing];
}


- (void)viewDidLoad

{
    
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
    
    // NSString *VersionString = [appsdict objectForKey:@"version"];
    
    // NSString *priceString = [appsdict objectForKey:@"price"];
    
    NSURL *imageURL = [NSURL URLWithString:[appsdict objectForKey:@"featuredimage"]];
    
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    
    UIImage *imageLoad = [[UIImage alloc] initWithData:imageData];
    
    
    NSString *dateString = [appsdict objectForKey:@"date"];
    NSString *authorString = [appsdict objectForKey:@"author"];
    
    cell.textLabel.text = [appsdict objectForKey:@"title"];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Posted on: %@ by %@",dateString, authorString];
    
    cell.imageView.image = imageLoad;
    
    return cell;
    
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark – Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSDictionary *appsdict = [jsonResults objectAtIndex:indexPath.row];
    
    NSString *appURL = [appsdict objectForKey:@"trackViewUrl"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURL]];
    
}

@end
