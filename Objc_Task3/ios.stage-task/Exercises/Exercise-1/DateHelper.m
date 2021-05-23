#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber != 0 && monthNumber <= 12) {
        NSDictionary *month = @{
            @1 : @"January",
            @2 : @"February",
            @3 : @"March",
            @4 : @"April",
            @5 : @"May",
            @6 : @"June",
            @7 : @"July",
            @8 : @"August",
            @9 : @"September",
            @10 : @"October",
            @11 : @"November",
            @12 : @"December"
        };
        return month[[NSNumber numberWithUnsignedInteger:monthNumber]];
    }
        return nil;
    
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSDate *dateFromInput = [formatter dateFromString:date];
    formatter.dateFormat = @"dd";
    return [[formatter stringFromDate:dateFromInput] integerValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    switch ([calendar component:NSCalendarUnitWeekday fromDate:date]) {
        case 1: return @"Вс";
        case 2: return @"Пн";
        case 3: return @"Вт";
        case 4: return @"Ср";
        case 5: return @"Чт";
        case 6: return @"Пт";
        case 7: return @"Сб";
        default:
            return nil;;
    }
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDate *currentDate = [NSDate now];
    if ([calendar component:NSCalendarUnitWeekOfMonth fromDate:date] == [calendar component:NSCalendarUnitWeekOfMonth fromDate:currentDate]) {
        return YES;
    } else {
        return NO;
    }
}

@end
