//
//  NewTreeViewController.m
//  TableViews 1
//
//  Created by Douglas Edmonson on 6/22/12.
//  Copyright (c) 2012 Clemson University. All rights reserved.
//

#import "NewTreeViewController.h"

@implementation NewTreeViewController

#pragma mark - Property Syntheses
@synthesize delegate = _delegate;
@synthesize treeName = _treeName;
@synthesize treeType = _treeType;

#pragma mark - Methods
/** Method used when you press the add button to add a new tree.
 */
- (IBAction)addTree {
    [self.delegate newTreeWithName:self.treeName.text AndType:self.treeType.text];
}

- (void)viewDidUnload
{
    [self setTreeName:nil];
    [self setTreeType:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
