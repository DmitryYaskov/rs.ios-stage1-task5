#import "Converter.h"
#import "CodeDescription.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

static NSString *eightCountryFormat = @"+xxx (xx) xxx-xxx";
static NSString *nineCountryFormat = @"+xxx (xx) xxx-xx-xx";
static NSString *tenCountryFormat = @"+x (xxx) xxx-xx-xx";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    //remove + if exist
    if ([string hasPrefix:@"+"] && string.length > 1) {
        string = [string substringFromIndex:1];
    }
    
    NSString *phone = string.copy;
    
    NSArray *codeDescriptions = @[
        [[CodeDescription alloc] initWithLenght:10 withCode:@"7" isoCode:@"RU" format:tenCountryFormat],
        [[CodeDescription alloc] initWithLenght:10 withCode:@"77" isoCode:@"KZ" format:tenCountryFormat],
        [[CodeDescription alloc] initWithLenght:8 withCode:@"373" isoCode:@"MD" format:eightCountryFormat],
        [[CodeDescription alloc] initWithLenght:8 withCode:@"374" isoCode:@"AM" format:eightCountryFormat],
        [[CodeDescription alloc] initWithLenght:9 withCode:@"375" isoCode:@"BY" format:nineCountryFormat],
        [[CodeDescription alloc] initWithLenght:9 withCode:@"380" isoCode:@"UA" format:nineCountryFormat],
        [[CodeDescription alloc] initWithLenght:9 withCode:@"992" isoCode:@"TJ" format:nineCountryFormat],
        [[CodeDescription alloc] initWithLenght:8 withCode:@"993" isoCode:@"TM" format:eightCountryFormat],
        [[CodeDescription alloc] initWithLenght:9 withCode:@"994" isoCode:@"AZ" format:nineCountryFormat],
        [[CodeDescription alloc] initWithLenght:9 withCode:@"996" isoCode:@"KG" format:nineCountryFormat],
        [[CodeDescription alloc] initWithLenght:9 withCode:@"998" isoCode:@"UZ" format:nineCountryFormat],
    ];
    
    if ([phone hasPrefix:@"+"] && phone.length > 1) {
        phone = [phone substringFromIndex:1];
    }
    
    CodeDescription* currentCodeDescription = nil;
    for (CodeDescription* codeDescription in codeDescriptions) {
        if ([codeDescription isMyCounryProne:phone]) {
            currentCodeDescription = codeDescription;
        }
    }
    
    if (currentCodeDescription == nil) {
        NSString *result = [string substringToIndex: MIN(string.length, 12)];
        result = [NSString stringWithFormat:@"+%@", result];
        return @{KeyPhoneNumber: result,
                 KeyCountry: @""};
    }
    
    NSString *result = [currentCodeDescription formatPhone: phone];
    
    return @{KeyPhoneNumber: result,
             KeyCountry: currentCodeDescription.isoCode};
}
@end
