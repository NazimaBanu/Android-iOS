//
//  main.m
//  Mycalc
//  Copyright © 2017 seneca college. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "calculator brain.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        calculator_brain *c=[[calculator_brain alloc]init];
        [c pushItem:8];
        [c pushItem:4];
        double result=[c calculate:@"+"];
        NSLog(@"Result is:%f",result);
    }
    return 0;
    
}
