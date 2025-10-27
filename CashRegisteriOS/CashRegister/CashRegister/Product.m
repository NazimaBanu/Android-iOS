//Svetlana Molodtsova
//  Product.m
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import "Product.h"

@implementation Product
- (instancetype)initWithValues:(NSString*)name ProductDescription:(NSString*)desc Category:(NSString*)category Price:(double)price Quantity:(int)qty
{
    self = [super init];
    if(self){
        _ProductName = name;
        _ProductDescription = desc;
        _Category = category;
        _Price = price;
        _QuantityOnHand = qty;
    }
    
    return self;
}
@end
