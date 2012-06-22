//
//  ViewController.m
//  TableViews 1
//
//  Created by DJ Edmonson on 6/21/12.
//  Copyright (c) 2012 Clemson University. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

@synthesize myTrees = _myTrees;

- (TreeContainer *)myTrees{
    if (!_myTrees) {
        _myTrees = [[TreeContainer alloc] init];
    }
    return _myTrees;
}

- (void)newTreeWithName:(NSString *)newName AndType:(NSString *)newType{
    [self.myTrees addTreeWithName:newName AndType:newType];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myTrees addTreeWithName:@"Red Apple Tree" AndType:@"Fruit"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableView DataSource Methods

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.myTrees numberOfTreesInSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[self.myTrees getTreeTypes] objectAtIndex:section];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"treeCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"treeCell"];
    }
    
    Tree *tree = [[self.myTrees getTreesInSection:indexPath.section] objectAtIndex:indexPath.row];
   
    cell.textLabel.text = tree.name;
    cell.detailTextLabel.text = tree.type;
    
    return cell;
}

#pragma mark - UITableView Delegate Methods

@end
