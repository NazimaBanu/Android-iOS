//
//  Product.h
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic)NSString* ProductName;
@property (nonatomic)NSString* ProductDescription;
@property (nonatomic)NSString* Category;
@property double Price;
@property int QuantityOnHand;
- (instancetype)initWithValues:(NSString*)name ProductDescription:(NSString*)desc Category:(NSString*)category Price:(double)price Quantity:(int)qty;
@end

