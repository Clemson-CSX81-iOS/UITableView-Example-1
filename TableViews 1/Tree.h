//
//  Tree.h
//  TableViews 1
//
//  Created by Douglas Edmonson on 6/22/12.
//
//

#import <Foundation/Foundation.h>

@interface Tree : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;


- (id)init;
- (id)initWithName:(NSString *)treeName AndType:(NSString *)treeType;

+ (id)treeWithName:(NSString *)treeName AndType:(NSString *)treeType;

@end
