//
//  ListOfTransactions.m
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import "ListOfTransactions.h"

@implementation ListOfTransactions
-(NSMutableArray*)Transactions{
    if(_Transactions == nil){
        _Transactions = [[NSMutableArray alloc]init];
    }
    return _Transactions;
}

@end
