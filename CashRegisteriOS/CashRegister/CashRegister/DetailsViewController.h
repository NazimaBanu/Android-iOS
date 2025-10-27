//
//  DetailsViewController.h
//  CashRegister
//
//  Created by user131026 on 10/22/17.
//  Copyright © 2017 seneca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransactionsHistoryViewTableViewController.h"
#import "Transaction.h"
@interface DetailsViewController : UIViewController
@property (nonatomic)Transaction* selected_transaction;
@end
