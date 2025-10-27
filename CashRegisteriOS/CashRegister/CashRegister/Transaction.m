//
//  Transaction.m
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction
- (instancetype)initWithValues:(Product*)product QuantityPurchased:(int)qty
                   TotalAmount:(double)total{
    self = [super init];
    if (self) {
        _ProductPurchased = product;
        _QuantityPurchased = qty;
        _TotalAmount = total;
        _currentDate = [NSDate date];
    }
    return self;
}
@end
