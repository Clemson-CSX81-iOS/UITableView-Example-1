//
//  TreeContainer.m
//  TableViews 1
//
//  Created by Douglas Edmonson on 6/22/12.
//
//

#import "TreeContainer.h"

@interface TreeContainer()
@property (nonatomic, strong) NSMutableDictionary *treeDictonary;
@end

@implementation TreeContainer

#pragma mark - Property Syntheses
@synthesize treeDictonary = _treeDictonary;

#pragma mark - Methods
#pragma mark Property Methods
/** Property getter for TreeDictionary.
    This gitter lets you lazily instantiate the property.
 */
-(NSMutableDictionary *)treeDictonary{
    if (!_treeDictonary) {
        _treeDictonary = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    return _treeDictonary;
}

#pragma mark Information Getters
/** Returns the number of tree types.
 */
-(NSInteger)numberOfTreeTypes{
    return [[self.treeDictonary allKeys] count];
}

/** Returns the numner of trees of a given type or -1 if the types
    does not exist.
 */
- (NSInteger)numberOfTreesWithType:(NSString *)type{
    NSArray *trees = [self.treeDictonary objectForKey:type];
    if (!trees) {
        return -1;
    } else {
        return [trees count];
    }
}

/** Returns the number of trees based on the index of the type.
 */
- (NSInteger)numberOfTreesInSection:(NSInteger)section{
    NSArray *types = self.treeDictonary.allKeys;
    if (section >= [types count])
        return -1;
    else
    return [self numberOfTreesWithType:[types objectAtIndex:section]];
}


#pragma mark Tree Getters
/** Returns the tree with a given name.
 */
-(Tree *)getTreeWithName:(NSString *)name{
    Tree *result;
    
    for (NSString *type in self.treeDictonary.allKeys) {
        for (NSArray *trees in [self.treeDictonary valueForKey:type]) {
            for (Tree *tree in trees) {
                if ([tree.name isEqualToString:name]) {
                    result = tree;
                }
            }
        }
    }
    return result;
}

/** Returns an array of trees based on the section number.
 */
-(NSArray *)getTreesInSection:(NSInteger)section{
    return [self.treeDictonary objectForKey:[self.treeDictonary.allKeys objectAtIndex:section]];
}

/** Returns an array of trees based on the type name.
 */
-(NSArray *)getTreesWithType:(NSString *)type{
    return [self.treeDictonary objectForKey:type];
}

/** Returns an array of tree types.
 */
-(NSArray *)getTreeTypes{
    return self.treeDictonary.allKeys;
}


#pragma mark Tree Adders
/** Addes the given tree to the dictionary.
 */
-(void)addTree:(Tree *)newTree{
    NSArray *trees = [[self.treeDictonary objectForKey:newTree.type] arrayByAddingObject:newTree];
    if (!trees) {
        trees = [NSArray arrayWithObject:newTree];
    }
    [self.treeDictonary setObject:trees
                           forKey:newTree.type];
}

/** Creates a new Tree with the given name and type then adds it to the dictionary.
 */
-(void)addTreeWithName:(NSString *)treeName AndType:(NSString *)treeType{
    Tree *newTree = [Tree treeWithName:treeName AndType:treeType];
    [self addTree:newTree];
}


#pragma mark Tree Removers
/** Removes a given tree from the dictionary.
 */
-(void)removeTree:(Tree *)tree{
    NSMutableArray *newTreeList = [[self.treeDictonary objectForKey:tree.type] mutableCopy];
    [newTreeList removeObject:tree];
    if ([newTreeList count] == 0) {
        [self.treeDictonary removeObjectForKey:tree.type];
    } else {
        [self.treeDictonary setObject:[newTreeList copy] forKey:tree.type];
    }
}

/** removes a tree with a given name from the dictionary.
 */
-(void)removeTreeWithName:(NSString *)treeName{
    Tree *tree = [self getTreeWithName:treeName];
    [self removeTree:tree];
}

@end