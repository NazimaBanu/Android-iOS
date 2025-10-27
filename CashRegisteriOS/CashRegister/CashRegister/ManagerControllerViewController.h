//
//  ManagerControllerViewController.h
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListOfTransactions.h"
#import "ListOfProducts.h"

@interface ManagerControllerViewController : UIViewController
@property (nonatomic)ListOfTransactions* trnsList;
@property (nonatomic)ListOfProducts* productsList;
@end
