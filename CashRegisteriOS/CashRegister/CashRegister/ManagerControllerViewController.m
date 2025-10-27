//
//  ManagerControllerViewController.m
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import "ManagerControllerViewController.h"
#import "ViewController.h"
#import "TransactionsHistoryViewTableViewController.h"
#import "UpdateInventory.h"
#import "ListOfTransactions.h"
#import "ListOfProducts.h"
#import "DetailsViewController.h"

@interface ManagerControllerViewController ()

@end

@implementation ManagerControllerViewController
-(ListOfProducts*)productsList
{
    if (_productsList == nil) {
        _productsList = [[ListOfProducts alloc]init];
    }
    return _productsList;
}
-(ListOfTransactions*)trnsList{
    if(_trnsList == nil){
        _trnsList = [[ListOfTransactions alloc]init];
    }
    return _trnsList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"TransactionsHistorySegue"]){
        TransactionsHistoryViewTableViewController* trnsView = [segue destinationViewController];
        trnsView.transactionsList = self.trnsList;
    }
}
@end

