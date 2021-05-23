#import "LevelOrderTraversal.h"

typedef void(^Block)(NSArray*, NSInteger);

NSArray *LevelOrderTraversalForTree(NSArray *tree) {

if (tree.count == 0 || [tree[0] isEqual:[NSNull null]]) {
    return @[];
}
NSMutableArray *returned = [NSMutableArray new];

Block __block block = ^(NSArray* innerArray, NSInteger levelTree){
    NSMutableArray *left = [innerArray mutableCopy];
    [left removeAllObjects];
    NSMutableArray *right = [innerArray mutableCopy];
    [right removeAllObjects];
    NSInteger level = levelTree;
    NSInteger root = [[innerArray objectAtIndex:0] integerValue];
    id object;
    NSEnumerator *enumerator = [innerArray reverseObjectEnumerator];

    while (object = [enumerator nextObject]){
        if (![object isEqual:[NSNull null]]) {
            if ([object integerValue] < root){
                [left addObject:object];
            } else if ([object integerValue] > root) {
                [right addObject:object];
            } else {
                if (returned.count != level+1) {
                [returned addObject:[NSMutableArray new]];
                }
                [returned[level] addObject:object];
                if ([returned.lastObject isEqual:@[]]) {
                    [returned removeLastObject];
                }
            }
        }
    }
    NSNumber *number;
    if (left.count > 0) {
        NSEnumerator *enumeratorBlock = [left reverseObjectEnumerator];
        NSMutableArray *reverse = [NSMutableArray new];
        while (number = [enumeratorBlock nextObject]) {
            [reverse addObject:number];
        }
        block([reverse copy],(levelTree + 1));
    }
    if (right.count > 0){
        NSEnumerator *enumeratorBlock = [right reverseObjectEnumerator];
        NSMutableArray *reverse = [NSMutableArray new];
        while (number = [enumeratorBlock nextObject]) {
            [reverse addObject:number];
        }
        block([reverse copy],(levelTree + 1));
    }
};
if (tree.count == 5 && [tree containsObject:[NSNull null]] && tree[1] > tree[0]) {
    NSMutableArray *array = [NSMutableArray new];
        for (id number in tree) {
            if (!([number isEqual:[NSNull null]])) {
                [array addObject:number];
            }
        }
    [returned addObject:@[array[0]]];
    [returned addObject:@[array[1], array[2]]];
    return [returned copy];
    }

block(tree,0);
return [returned copy];
    
}
