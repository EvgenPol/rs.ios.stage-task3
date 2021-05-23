#import "PlayersSeparator.h"

@implementation PlayersSeparator

//Each team must meet one of the conditions: (`ratingArray[i] < ratingArray[j] < ratingArray[k]`) or (`ratingArray[i] > ratingArray[j] > ratingArray[k]`) where (`0 <= i < j < k < n`).

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if (ratingArray.count < 3){
        return 0;
    }
    NSMutableArray <NSOrderedSet *> *commands = [NSMutableArray new];
    NSInteger returnedValue = 0;
    
    for (NSInteger i = 0; i != ratingArray.count; i++) {
        for (NSInteger j = 0; j != ratingArray.count; j++) {
            if (i < j ) {
                for (NSInteger k = 0; k != ratingArray.count; k++) {
                    if (j < k) {
                        NSInteger scoreI = [ratingArray[i] integerValue];
                        NSInteger scoreJ = [ratingArray[j] integerValue];
                        NSInteger scoreK = [ratingArray[k] integerValue];
                             if (((scoreI < scoreJ) && (scoreJ < scoreK)) || ((scoreI > scoreJ) && (scoreJ > scoreK))) {
                                 if (![commands containsObject:[NSOrderedSet orderedSetWithArray:@[[NSNumber numberWithInteger:i], [NSNumber numberWithInteger:j], [NSNumber numberWithInteger:k]]]]){
                                     NSLog(@"%ld , %ld, %ld", (long)i, j, k);
                                        [commands addObject:[NSOrderedSet orderedSetWithArray:@[[NSNumber numberWithInteger:i], [NSNumber numberWithInteger:j], [NSNumber numberWithInteger:k]]]];
                                        returnedValue++;
                                    }
                            }
                        }
                    }
                }
        }
    }
    NSLog(@"%ld", (long)returnedValue);
    return returnedValue;
}

@end
