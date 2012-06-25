//
//  TreeContainer.h
//  TableViews 1
//
//  Created by Douglas Edmonson on 6/22/12.
//
//

#import <Foundation/Foundation.h>
#import "Tree.h"

@interface TreeContainer : NSObject

-(NSInteger)numberOfTreeTypes;
-(NSInteger)numberOfTreesWithType:(NSString *)type;
-(NSInteger)numberOfTreesInSection:(NSInteger)section;

-(Tree *)getTreeWithName:(NSString *)name;
-(NSArray *)getTreesInSection:(NSInteger)section;
-(NSArray *)getTreesWithType:(NSString *)type;
-(NSArray *)getTreeTypes;

-(void)addTree:(Tree *)newTree;
-(void)addTreeWithName:(NSString *)treeName AndType:(NSString *)treeType;

-(void)removeTree:(Tree *)tree;
-(void)removeTreeWithName:(NSString *)treeName;

@end
