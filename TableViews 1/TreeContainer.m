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

@synthesize treeDictonary = _treeDictonary;

-(NSMutableDictionary *)treeDictonary{
    if (!_treeDictonary) {
        _treeDictonary = [NSMutableDictionary dictionaryWithCapacity:3];
    }
    return _treeDictonary;
}

-(NSInteger)numberOfTreeTypes{
    return [[self.treeDictonary allKeys] count];
}

- (NSInteger)numberOfTreesWithType:(NSString *)type{
    return [[self.treeDictonary objectForKey:type] count];
}

- (NSInteger)numberOfTreesInSection:(NSInteger)section{
    return [self numberOfTreesWithType:[self.treeDictonary.allKeys objectAtIndex:section]];
}

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

-(NSArray *)getTreesInSection:(NSInteger)section{
    return [self.treeDictonary objectForKey:[self.treeDictonary.allKeys objectAtIndex:section]];
}

-(NSArray *)getTreesWithType:(NSString *)type{
    return [self.treeDictonary objectForKey:type];
}

-(NSArray *)getTreeTypes{
    return self.treeDictonary.allKeys;
}

-(void)addTree:(Tree *)newTree{
    NSArray *trees = [[self.treeDictonary objectForKey:newTree.type] arrayByAddingObject:newTree];
    if (!trees) {
        trees = [NSArray arrayWithObject:newTree];
    }
    [self.treeDictonary setObject:trees
                           forKey:newTree.type];
}

-(void)addTreeWithName:(NSString *)treeName AndType:(NSString *)treeType{
    Tree *newTree = [Tree treeWithName:treeName AndType:treeType];
    [self addTree:newTree];
}

-(void)removeTree:(Tree *)tree{
    NSMutableArray *newTreeList = [[self.treeDictonary objectForKey:tree.type] mutableCopy];
    [newTreeList removeObject:tree];
    [self.treeDictonary setObject:[newTreeList copy] forKey:tree.type];
}

-(void)removeTreeWithName:(NSString *)treeName{
    Tree *tree = [self getTreeWithName:treeName];
    [self removeTree:tree];
}

@end
