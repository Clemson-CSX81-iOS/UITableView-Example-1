//
//  NewTreeViewController.m
//  TableViews 1
//
//  Created by Douglas Edmonson on 6/22/12.
//  Copyright (c) 2012 Clemson University. All rights reserved.
//

#import "NewTreeViewController.h"

@implementation NewTreeViewController

@synthesize delegate = _delegate;
@synthesize treeName = _treeName;
@synthesize treeType = _treeType;

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

- (IBAction)addTree {
    [self.delegate newTreeWithName:self.treeName.text AndType:self.treeType.text];
}
@end
