//
//  ozark.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 2/19/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import "iPadTableHome.h"
//#import "ipadStory.h"
#import "QuartzCore/QuartzCore.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define kjsonURL [NSURL URLWithString: @"http://baylife.me/mobile/json"]

@interface iPadTableHome ()

@end
@implementation iPadTableHome {
    
    NSMutableArray *jsonResults;
    
    NSValue *valueBro;
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
    /* Pull to refresh stuff
     story2 *Story2 = [[story2 alloc] init];
     // Story2.idBro = 3;
     // Initialize Refresh Control
     // UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
     // Configure Refresh Control
     // [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
     // Configure View Controller
     //   [self setRefreshControl:refreshControl];
     */
    NSInteger red = 125;
    NSInteger green = 38;
    NSInteger blue = 208;
    self.tabBarController.tabBar.selectedImageTintColor = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0]];
    
    [super viewDidLoad];
    
    
    dispatch_async(kBgQueue, ^{
        
        NSData* data = [NSData dataWithContentsOfURL:
                        
                        kjsonURL];
        
        [self performSelectorOnMainThread:@selector(fetchedData:)
         
                               withObject:data waitUntilDone:YES];
        
    });
    
}
- (NSString*)getPostId {
    return posty;
}
- (NSString*)getStoryTitle {
    return titley;
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
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return [jsonResults count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *appsdict = [jsonResults objectAtIndex:indexPath.row];
    
    // NSURL *imageURL = [NSURL URLWithString:[appsdict objectForKey:@"featuredimage"]];
    
    // NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    
    //  UIImage *imageLoad = [[UIImage alloc] initWithData:imageData];
    
    
    
    NSString *dateString = [appsdict objectForKey:@"date"];
    NSString *authorString = [appsdict objectForKey:@"author"];
    
    
    cell.textLabel.text = [appsdict objectForKey:@"title"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Posted on: %@ by %@",dateString, authorString];
    
    
    
    
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.cornerRadius = 13.0;
    
    cell.imageView.image = [UIImage imageNamed:@"144x144.png"];
    
    
    return cell;
}

#pragma mark – Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSDictionary *appsdict = [jsonResults objectAtIndex:indexPath.row];
    NSString *post = [appsdict objectForKey:@"id"];
    NSString *title = [appsdict objectForKey:@"title"];
    
    posty = post;
    titley = title;
    UIViewController *controller3 = [self.storyboard instantiateViewControllerWithIdentifier:@"iPadStory"];
    [self.navigationController pushViewController:controller3 animated:YES];
    
    
    //NSLog(@"valueBro:%@", _valueBro);
    NSLog(@"postId:%@", post);
    
    
}

@end
