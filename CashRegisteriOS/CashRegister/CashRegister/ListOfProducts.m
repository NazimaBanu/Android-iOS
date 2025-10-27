//
//  ListOfProducts.m
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import "ListOfProducts.h"

@implementation ListOfProducts
-(NSMutableArray*)Products{
    if(_Products == nil){
        _Products = [[NSMutableArray alloc]init];
    }
    return _Products;
}
@end
