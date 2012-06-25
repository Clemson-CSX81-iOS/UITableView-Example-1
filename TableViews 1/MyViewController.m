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
    if (tableView.editing && section == [self.myTrees numberOfTreeTypes]-1) {
        return count+1;
    }   
    return count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[self.myTrees getTreeTypes] objectAtIndex:section];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == [self.myTrees numberOfTreesInSection:indexPath.section] &&
        indexPath.section == [self.myTrees numberOfTreeTypes]-1) {
		// This is the insertion cell.
		static NSString *InsertionCellIdentifier = @"InsertionCell";
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:InsertionCellIdentifier];
		if (cell == nil) {		
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:InsertionCellIdentifier];
			cell.textLabel.text = @"Add Tree";
			cell.accessoryType = UITableViewCellAccessoryNone;
		}
		return cell;
	}
    
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

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// The add row gets an insertion marker, the others a delete marker.
    if (indexPath.row == [self.myTrees numberOfTreesInSection:indexPath.section]) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
    
    NSInteger sec = [self.myTrees numberOfTreeTypes]-1;
    NSInteger row = [self.myTrees numberOfTreesInSection:sec];
    
    
    NSArray *path = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:row inSection:sec]];
    
    if( editing ){
        [self.tableView insertRowsAtIndexPaths:path
                              withRowAnimation:UITableViewRowAnimationBottom];
    }
    else{
        [self.tableView deleteRowsAtIndexPaths:path
                              withRowAnimation:UITableViewRowAnimationBottom];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        [self performSegueWithIdentifier:@"pushNewTreeVC" sender:self];
    }
}
@end
