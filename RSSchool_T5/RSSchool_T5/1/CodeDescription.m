//
//  CodeDescription.m
//  RSSchool_T5
//
//  Created by DmitryYaskov on 03.05.2020.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import "CodeDescription.h"

@implementation CodeDescription

- (id)initWithLenght:(int)lenght withCode:(NSString *)code isoCode:(NSString *)isoCode format:(NSString *)format {
    if (self = [super init]) {
        self.lenght = lenght;
        self.code = code;
        self.isoCode = isoCode;
        self.format = format;
    }
    return self;
}

- (NSString*)formatPhone:(NSString *)phone {
    
    //cut string if longer than phone
    phone = [phone substringToIndex: MIN(self.lenght + self.code.length, phone.length)];
    
    NSMutableString *result = @"".mutableCopy;
    for (int i = 0; i < self.format.length; i++) {
        
        unichar character = [self.format characterAtIndex:i];
        if (character == 'x') {
            character = [phone characterAtIndex:0];
            phone = [phone substringFromIndex:1];
        }
        
        [result appendFormat:@"%c", character];
        if (phone.length < 1) {
            break;
        }
    }
    
    return result.copy;
}


- (BOOL)isMyCounryProne: (NSString *)phone {
    NSString *returnValue = phone.copy;
    return [returnValue hasPrefix: self.code];
}

@end
