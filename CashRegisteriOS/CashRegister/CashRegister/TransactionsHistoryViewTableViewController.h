//
//  TransactionsHistoryViewTableViewController.h
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListOfTransactions.h"
@interface TransactionsHistoryViewTableViewController : UITableViewController
@property (nonatomic)ListOfTransactions* transactionsList;
@end

