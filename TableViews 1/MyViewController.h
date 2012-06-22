//
//  ViewController.h
//  TableViews 1
//
//  Created by DJ Edmonson on 6/21/12.
//  Copyright (c) 2012 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewTreeViewController.h"
#import "TreeContainer.h"

@interface MyViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, NewTreeDelegate>

@property (strong, nonatomic) TreeContainer *myTrees;

@end