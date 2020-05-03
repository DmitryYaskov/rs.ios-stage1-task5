//
//  CodeDescription.h
//  RSSchool_T5
//
//  Created by DmitryYaskov on 03.05.2020.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CodeDescription : NSObject
@property (assign, nonatomic) int lenght;
@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *isoCode;
@property (strong, nonatomic) NSString *format;

- (id)initWithLenght:(int)lenght withCode:(NSString *)code isoCode:(NSString *)isoCode format:(NSString *)format;
- (NSString*)formatPhone:(NSString *)phone;
- (BOOL)isMyCounryProne : (NSString *)phone;

@end
