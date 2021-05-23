#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *returnedStr = [NSMutableString new];
    NSMutableString *str1 = [string1 mutableCopy]; //ACA
    NSMutableString *str2 = [string2 mutableCopy]; //BCF
    BOOL endWhile = NO;
    
    while (!endWhile) {
        if (str1.length > 0 && str2.length > 0) {
            if ([str1 characterAtIndex:0] <= [str2 characterAtIndex:0]) {
                   [returnedStr appendString:[str1 substringToIndex:1]];
                   str1 = [[str1 substringFromIndex:1] mutableCopy];
               } else {
                   [returnedStr appendString:[str2 substringToIndex:1]];
                   str2 = [[str2 substringFromIndex:1] mutableCopy];
               }
        } else if (str1.length > 0){
            [returnedStr appendString:[str1 substringToIndex:1]];
            str1 = [[str1 substringFromIndex:1] mutableCopy];
        } else if (str2.length > 0) {
            [returnedStr appendString:[str2 substringToIndex:1]];
            str2 = [[str2 substringFromIndex:1] mutableCopy];
        } else {
            endWhile = YES;
        }
    }
    return [returnedStr copy];
}

@end
