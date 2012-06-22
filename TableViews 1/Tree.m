//
//  Tree.m
//  TableViews 1
//
//  Created by Douglas Edmonson on 6/22/12.
//
//

#import "Tree.h"

@implementation Tree

@synthesize name = _name;
@synthesize type = _type;

- (id)init{
    self = [super init];
    if (self) {
        self.name = @"";
        self.type = @"";
    }
    return self;
}

- (id)initWithName:(NSString *)treeName AndType:(NSString *)treeType{
    self = [self init];
    if (self) {
        self.name = treeName;
        self.type = treeType;
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"N:%@ T:%@",self.name, self.type];
}

+ (id)treeWithName:(NSString *)treeName AndType:(NSString *)treeType{
    return [[Tree alloc] initWithName:treeName AndType:treeType];
}

@end
