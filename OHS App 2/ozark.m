//
//  ozark.m
//  OHS App 2
//
//  Created by ZACHARY FLETCHER on 2/19/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

//#import <FacebookSDK/FacebookSDK.h>
#import "ozark.h"
#import "story2.h"
#import "picture-story.h"
#import "jsonTest.h"
#import "QuartzCore/QuartzCore.h"




#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

//#define kjsonURL [NSURL URLWithString: @"http://baylife.me/mobile/json"]
#define kjsonURL [NSURL URLWithString: @"https://graph.facebook.com/142919315888548/feed?access_token=BAACEdEose0cBABU0PXay1XA0H9ZBOO5cEFATGabYgZCJgG1bBe2plLe88eXpWxgFrzdNQCd2yEIyJ1mZBcncPitn8AcfbjdY9ZCfH0v8kSZB8WffZC6TdxNoe0csGLqK16p4s2lEPKzLbKVdjtxAYEH0NRgaI9DFEZBmsvDJAK51tsUnHdEGppbvbNZBDmWRRQMZD"]



@interface ozark ()

@end
@implementation UIImage (PhoenixMaster)
- (UIImage *) makeThumbnailOfSize:(CGSize)size;
{
    UIGraphicsBeginImageContextWithOptions(size,NO,0);
    //UIGraphicsBeginImageContext(size);
    // draw scaled image into thumbnail context
    [self drawInRect:CGRectMake(0, 0, 64, 64)];
    UIImage *newThumbnail = UIGraphicsGetImageFromCurrentImageContext();
    // pop the context
    UIGraphicsEndImageContext();
    if(newThumbnail == nil)
        NSLog(@"could not scale image");
    return newThumbnail;
}

@end
@implementation ozark {

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
  //  [NSThread detachNewThreadSelector:@selector(doRefresh:) toTarget:self withObject:sender];
    sender.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated on %@",[formatter stringFromDate:[NSDate date]]];
    sender.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    
    
 
    
    
    
    NSData* data = [NSData dataWithContentsOfURL:
                    
                    kjsonURL];
    
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization
                          
                          JSONObjectWithData:data
                          
                          options:kNilOptions
                          
                          error:&error];
    jsonResults = [json objectForKey:@"data"];
   // [self.tableView getData];
    [self.tableView reloadData];
    [sender endRefreshing];
}

- (void)doRefresh:(UIRefreshControl *)sender {
    //[self checkUpdate];
    // [self loadData];
    
    
    /*
     NSData* data = [NSData dataWithContentsOfURL:
     
     kjsonURL];
     
     [self performSelectorOnMainThread:@selector(fetchedData:)
     
     withObject:data waitUntilDone:YES];
     
     
     
     [self.tableView reloadData];
     [sender endRefreshing];
     */

    NSData* data = [NSData dataWithContentsOfURL:
                    
                    kjsonURL];
    if(!data) {
        UIAlertView*aview=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Network error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil ];
        [aview show];
        return;
    } else {

    
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization
                          
                          JSONObjectWithData:data
                          
                          options:kNilOptions
                          
                          error:&error];
    jsonResults = [json objectForKey:@"data"];

    [self.tableView reloadData];
    [sender endRefreshing];
    
    
    }
}

- (void)endRefreshing {
    [activityIndicator stopAnimating];
    NSLog(@"END");
    
}





- (void)viewDidLoad
{

   // UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
   // [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
   // [self setRefreshControl:refreshControl];
    
  //  UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
   //[refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
   //[self setRefreshControl:refreshControl];
    
 // [activityIndicator stopAnimating];
    

    
    
    NSInteger red = 125;
    NSInteger green = 38;
    NSInteger blue = 208;
    self.tabBarController.tabBar.selectedImageTintColor = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0]];
   [self.navigationController.navigationController.navigationBar setTintColor:[UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0]];
    
    [super viewDidLoad];
    NSData* data = [NSData dataWithContentsOfURL:kjsonURL];
    if(!data) {
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


- (NSString*)getPostId {
    return posty;
}
- (NSInteger*)getId44 {
    return valueBro;
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
    jsonResults = [json objectForKey:@"data"];
   // jsonResults = [json objectForKey:@"results"];

    [self.tableView reloadData];
 //

  //  [activityIndicator stopAnimating];
    
    
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

-(NSString *)dateDiff:(NSString *)origDate {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setFormatterBehavior:NSDateFormatterBehavior10_4];
    [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:SSZZZZ"];
   // NSDictionary *appsdict = [jsonResults objectAtIndex:indexPath.row];
   // origDate = [appsdict objectForKey:@"created_time"];
    NSDate *convertedDate = [df dateFromString:origDate];
  //  [df release];
    NSDate *todayDate = [NSDate date];
    double ti = [convertedDate timeIntervalSinceDate:todayDate];
    ti = ti * -1;
    if(ti < 1) {
    	return @"over a month ago";
    } else 	if (ti < 60) {
    	return @"less than a minute ago";
    } else if (ti < 3600) {
    	int diff = round(ti / 60);
    	return [NSString stringWithFormat:@"%d minutes ago", diff];
    } else if (ti < 86400) {
    	int diff = round(ti / 60 / 60);
    	return[NSString stringWithFormat:@"%d hours ago", diff];
    } else if (ti < 2629743) {
    	int diff = round(ti / 60 / 60 / 24);
    	return[NSString stringWithFormat:@"%d days ago", diff];
    } else {
    	return @"over a month ago";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *appsdict = [jsonResults objectAtIndex:indexPath.row];
    
   // NSURL *imageURL = [NSURL URLWithString:[appsdict objectForKey:@"featuredimage"]];
    
   // NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    
  //  UIImage *imageLoad = [[UIImage alloc] initWithData:imageData];
    

/*
    NSString *dateString = [appsdict objectForKey:@"date"];
    NSString *authorString = [appsdict objectForKey:@"author"];
    
    
   cell.textLabel.text = [appsdict objectForKey:@"title"];
cell.detailTextLabel.text = [NSString stringWithFormat:@"Posted on: %@ by %@",dateString, authorString];
    
  
    */
    
 
   // NSString *dateString = [appsdict objectForKey:@"created_time"];

    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setFormatterBehavior:NSDateFormatterBehavior10_4];

    [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:SSZZZZ"];
   // NSDate *convertedDate = [df dateFromString:dateString];

    
    NSString *string = [appsdict objectForKey:@"message"]; 
    NSRange range = [string rangeOfString:@"\n"];
    NSString *shortString = [string substringToIndex:range.location];
    
   

    
  /*
    [cell.imageView setImage:[[UIImage alloc] initWithData:imageData]];
    [cell.imageView setBackgroundColor:[UIColor blackColor]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    CGRect imageViewFrame = cell.imageView.frame;
    imageViewFrame.size.width = 60;
    imageViewFrame.size.height = 60;
   */
    
    

    //CGPoint velocity = [tableView.panGestureRecognizer velocityInView:tableView];
   // NSLog(@"Velocity:%@",NSStringFromCGPoint(velocity));

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0);
    dispatch_async(queue, ^{
        NSString *objectId33 = [appsdict objectForKey:@"object_id"];
        NSString *highQual = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=normal",objectId33];
        NSURL *highQual2 = [NSURL URLWithString:highQual];
        NSData *imageData = [NSData dataWithContentsOfURL:highQual2];
        UIImage *imageLoad2 = [[UIImage alloc] initWithData:imageData];
                dispatch_sync(dispatch_get_main_queue(), ^{
    if(!imageData) {
        cell.imageView.image = [UIImage imageNamed:@"Hillbilly-Rounded1.png"];
    } else if(imageData) {
        cell.imageView.layer.masksToBounds = YES;
        cell.imageView.layer.cornerRadius = 13.0;
    UIImage *smallPic = [imageLoad2 makeThumbnailOfSize:CGSizeMake(64,64)];
    cell.imageView.image = smallPic;
    }
                                [cell setNeedsLayout];
    });
    });




    NSDateFormatter *d2 = [[NSDateFormatter alloc] init];
    [d2 setFormatterBehavior:NSDateFormatterBehavior10_4];
    [d2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:SSZZZZ"];
      NSString *origDate = [appsdict objectForKey:@"created_time"];
    NSDate *convertedDate2 = [df dateFromString:origDate];
    NSDate *todayDate = [NSDate date];
    double ti = [convertedDate2 timeIntervalSinceDate:todayDate];
    ti = ti * -1;
    if(ti < 1) {
    	cell.detailTextLabel.text = @"never";
    } else 	if (ti < 60) {
    	cell.detailTextLabel.text = @"posted less than a minute ago";
    } else if (ti < 3600) {
    	int diff = round(ti / 60);
    	cell.detailTextLabel.text = [NSString stringWithFormat:@"posted %d minutes ago", diff];
    } else if (ti < 86400) {
    	int diff = floor(ti / 60 / 60);
    	cell.detailTextLabel.text = [NSString stringWithFormat:@"posted %d hours ago", diff];
    } else if (ti < 2629743) {
    	int diff = round(ti / 60 / 60 / 24);
    	cell.detailTextLabel.text = [NSString stringWithFormat:@"posted %d days ago", diff];
          //  cell.detailTextLabel.text = date2;
    } else if (ti < 31556916) {
        int diff = floor(ti / 60 / 60 / 24 / 30);
        if (diff < 2){
            	cell.detailTextLabel.text = [NSString stringWithFormat:@"posted %d month ago", diff];
        }
        else {
         	cell.detailTextLabel.text = [NSString stringWithFormat:@"posted %d months ago", diff];
        }
    }
    else if (ti > 31556916) {
        cell.detailTextLabel.text = @"over a year ago";
    }
    else { cell.detailTextLabel.text = @"Error";
    }
    


    cell.textLabel.text = shortString;
//    cell.detailTextLabel.text = date2;
    //NSLog(@"Date:%@",dateString);
   // NSLog(@"D:%@",convertedDate);
   // NSLog(@"Diff:%@",dateDiff);
   // cell.detailTextLabel.text = [appsdict objectForKey:@"created_time"];
    cell.imageView.layer.masksToBounds = YES;
   // cell.imageView.layer.cornerRadius = 13.0;
    
   // cell.imageView.image = [UIImage imageNamed:@"Hillbilly-Rounded1.png"];
   // [cell.imageView setContentMode:UIViewContentModeCenter | UIViewContentModeRedraw];
    //   cell.imageView.image = imageLoad2;
  //  [cell.imageView setBounds:CGRectMake(0,0,30,30)];
    //[cell.imageView setFrame:CGRectMake(0,0,30,30)];
    //[cell setNeedsLayout];


    
    
   // [activityIndicator stopAnimating];
      return cell;
}

#pragma mark – Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {

        valueBro = indexPath.row;
        NSDictionary *appsdict = [jsonResults objectAtIndex:indexPath.row];
        NSString *post = [appsdict objectForKey:@"id"];
        posty = post;
   
        NSURL *imageURL = [NSURL URLWithString:[appsdict objectForKey:@"picture"]];
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        //CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        NSLog(@"Height:%f",screenHeight);
        
        
   // if(imageURL && screenHeight == 480) {
   //     UIViewController *controller3 = [self.storyboard instantiateViewControllerWithIdentifier:@"picture-story"];
   //     [self.navigationController pushViewController:controller3 animated:YES];
   // }
    //    if(imageURL && screenHeight == 568) {
    //        UIViewController *controller3 = [self.storyboard instantiateViewControllerWithIdentifier:@"picture-story5"];
     //       [self.navigationController pushViewController:controller3 animated:YES];
    if(imageURL) {
             UIViewController *controller3 = [self.storyboard instantiateViewControllerWithIdentifier:@"picture-story"];
             [self.navigationController pushViewController:controller3 animated:YES];
    } else if (!imageURL && screenHeight == 480) {
        UIViewController *controller3 = [self.storyboard instantiateViewControllerWithIdentifier:@"storypage"];
        [self.navigationController pushViewController:controller3 animated:YES];
    } else if (!imageURL && screenHeight == 568) {
        UIViewController *controller3 = [self.storyboard instantiateViewControllerWithIdentifier:@"jsonTest5"];
        [self.navigationController pushViewController:controller3 animated:YES];
    }


       // NSLog(@"valueBro:%@", _valueBro);
       // NSLog(@"postId:%@", post);
    
   /* NSDictionary *appsdict = [jsonResults objectAtIndex:indexPath.row];
    NSString *post = [appsdict objectForKey:@"id"];
    NSString *title = [appsdict objectForKey:@"title"];
    
    posty = post;
    titley = title;
    UIViewController *controller3 = [self.storyboard instantiateViewControllerWithIdentifier:@"story2"];
    [self.navigationController pushViewController:controller3 animated:YES];*/
//NSLog(@"ID222:%d",indexPath.row);
  
}

- (IBAction)refreshHome:(id)sender {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
   // CGFloat screenWidth = screenRect.size.width;
    NSLog(@"Height:%f",screenHeight);
    //[activityIndicator startAnimating];
 //   _loading.hidden = false;
  //  [self.view addSubview: _loading];
  //  _loading.color = [UIColor blackColor];
   // [_loading startAnimating];
   // [self.navigationItem.leftBarButtonItem setEnabled:NO];
   // [self.navigationItem.leftBarButtonItem.image = @"Hillbilly-Rounded1.png"];
 //   UIImageView *iconView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"48v3.png"]];
 //   UIBarButtonItem *icon = [[UIBarButtonItem alloc] initWithCustomView:iconView];
 //   self.navigationItem.leftBarButtonItem=icon;
    
  //  activityIndicator = [UIActivityIndicatorView alloc];
    //UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
        //[self.view addSubview: activityIndicator];
   // [self navigationItem].rightBarButtonItem = barButton;
    
    
    
    //activityIndicator = [UIActivityIndicatorView alloc];
   // UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
   // [self navigationItem].rightBarButtonItem = barButton;
    //[activityIndicator startAnimating];
    //[self.view addSubview: activityIndicator];
    
  //  activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake( screenWidth / 2,  screenHeight / 3, 1,1)];
 //   activityIndicator.transform = CGAffineTransformMakeScale(2.0, 2.0);
  //  activityIndicator.color = [UIColor blackColor];
   // [self.view addSubview: activityIndicator];
  //  [activityIndicator startAnimating];
    NSData *data = [NSData dataWithContentsOfURL:
                    
                    kjsonURL];
    if(!data) {
        UIAlertView*aview=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Network error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil ];
        [aview show];
        return;
    } else {
        
        
        NSError* error;
        
        NSDictionary* json = [NSJSONSerialization
                              
                              JSONObjectWithData:data
                              
                              options:kNilOptions
                              
                              error:&error];
        jsonResults = [json objectForKey:@"data"];
        [activityIndicator stopAnimating];

        [self.tableView reloadData];
        [super viewDidLoad];
        
        
    }
    
   
}


- (void)viewDidUnload {
  //  [self setPullToRefresh:nil];
    [self setBarItem:nil];
    [self setLoading:nil];
    [super viewDidUnload];
}
@end
