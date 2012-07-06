//
//  ViewController.m
//  TableViews 1
//
//  Created by DJ Edmonson on 6/21/12.
//  Copyright (c) 2012 Clemson University. All rights reserved.
//

#import "MyViewController.h"

@implementation MyViewController

#pragma mark - Property Syntheses
@synthesize myTrees = _myTrees;

#pragma mark - Methods
#pragma mark Property Getter
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myTrees addTreeWithName:@"Red Apple Tree" AndType:@"Fruit"];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"pushNewTreeVC"]) {
        [segue.destinationViewController setDelegate:self];
    }
}

/** This allows for lazy instantiation of the property.
 */
- (TreeContainer *)myTrees{
    if (!_myTrees) {
        _myTrees = [[TreeContainer alloc] init];
    }
    return _myTrees;
}

- (void) newTreeWithName:(NSString *)newName AndType:(NSString *)newType{
    [self.myTrees addTreeWithName:newName AndType:newType];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableView DataSource Methods

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.myTrees numberOfTreeTypes];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [self.myTrees numberOfTreesInSection:section];  
    return count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[self.myTrees getTreeTypes] objectAtIndex:section];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView 
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    return UITableViewCellEditingStyleDelete;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath 
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Tree *tree = [[self.myTrees getTreesInSection:indexPath.section] objectAtIndex:indexPath.row];
        [self.myTrees removeTree:tree];
        [tableView beginUpdates];
        if ([self.myTrees numberOfTreesInSection:indexPath.section] == -1) {
            NSLog(@"Remove Section");
            [self.tableView deleteSections:[[NSIndexSet alloc] initWithIndex:indexPath.section] 
                          withRowAnimation:UITableViewRowAnimationAutomatic];
        } else {
            NSLog(@"Remove Row");
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
                                  withRowAnimation:UITableViewRowAnimationBottom];
        }
        [tableView endUpdates];
    }
}

@end