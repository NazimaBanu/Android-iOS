//
//  Transaction.h
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Transaction : NSObject
@property (nonatomic)Product* ProductPurchased;
@property int QuantityPurchased;
@property double TotalAmount;
@property NSDate* currentDate;
- (instancetype)initWithValues:(Product*)product QuantityPurchased:(int)qty
                   TotalAmount:(double)total;
@end
