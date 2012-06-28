//
//  Tree.m
//  TableViews 1
//
//  Created by Douglas Edmonson on 6/22/12.
//
//

#import "Tree.h"

@implementation Tree

#pragma mark - Property Syntheses
@synthesize name = _name;
@synthesize type = _type;

#pragma mark - Methods

/** Helper Initalizer.
    This initalizer just creates a Tree without a name or type
 */
- (id)init{
    return [self initWithName:@"" AndType:@""];
}

/** Designated Initalizer.
    This initalizer creates a Tree with the given name and type
 
 @param treeName The name of the new Tree
 @param treeType The type of the new Tree
 */
- (id)initWithName:(NSString *)treeName AndType:(NSString *)treeType{
    self = [self init];
    if (self) {
        self.name = treeName;
        self.type = treeType;
    }
    return self;
}

/** Class factory method.
    This method is a class method you can use to create a Tree Object.
 
 @param treeName The name of the new Tree
 @param treeType The type of the new Tree
 */
+ (id)treeWithName:(NSString *)treeName AndType:(NSString *)treeType{
    return [[Tree alloc] initWithName:treeName AndType:treeType];
}

/** Provides a descriptive NSString for the instance.
    This method is called when you try to print out the object using `NSLog()`
 
 @return Returns the NSString description of the instance.
 */
- (NSString *)description{
    return [NSString stringWithFormat:@"N:%@ T:%@",self.name, self.type];
}
@end
