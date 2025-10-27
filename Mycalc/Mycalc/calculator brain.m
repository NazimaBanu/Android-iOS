//
//  calculator brain.m
//  Mycalc
//  Copyright © 2017 seneca college. All rights reserved.
//

#import "calculator brain.h"
@interface calculator_brain();
@property (nonatomic) NSMutableArray *ListofNumbers;

@end
@implementation calculator_brain
-(void)pushItem:(double)Number{
    
    
    
    
        if(_ListofNumbers == nil){
            _ListofNumbers= [[NSMutableArray alloc]init];
        }
    
    
NSNumber *numObj = [NSNumber numberWithDouble:Number];
    [self.ListofNumbers addObject:numObj];

}
-(double)PopItem
{

    NSNumber *value=[self.ListofNumbers lastObject];
    double value1=[value doubleValue];
    [self.ListofNumbers removeLastObject];
    return value1;
    
}

-(double)calculate:(NSString *)op{
    double number1=self.PopItem;
    double number2=self.PopItem;
    return number1+number2;
}
@end;
