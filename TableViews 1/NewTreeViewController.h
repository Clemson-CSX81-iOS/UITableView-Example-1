//
//  NewTreeViewController.h
//  TableViews 1
//
//  Created by Douglas Edmonson on 6/22/12.
//  Copyright (c) 2012 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewTreeDelegate <NSObject>

@required
- (void) newTreeWithName:(NSString *)newName AndType:(NSString *)newType;

@end

@interface NewTreeViewController : UIViewController

@property (weak  , nonatomic) id<NewTreeDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *treeName;
@property (strong, nonatomic) IBOutlet UITextField *treeType;

- (IBAction)addTree;
@end
