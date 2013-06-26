//
//  parseTable.h
//  OHS App 2
//
//  Created by Hunter Harris on 5/18/13.
//  Copyright (c) 2013 ZACHARY FLETCHER. All rights reserved.
//

#import <Parse/Parse.h>
NSString *titlePost;
NSString *getPostId;
NSString *posty;
@interface parseTable : PFQueryTableViewController
@property (nonatomic) NSValue *getPostId;
@property (nonatomic) NSString *titlePost;
@end
//lolk
