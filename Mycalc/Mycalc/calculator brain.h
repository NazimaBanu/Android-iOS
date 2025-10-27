//  
//  calculator brain.h
//  Mycalc
//  Copyright © 2018 seneca college. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calculator_brain : NSObject
-(void)pushItem: (double) number;
-(double)calculate: (NSString *)op;
@end
