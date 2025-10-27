//Svetlana Molodtsova
//  TransactionsHistoryViewTableViewController.m
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import "TransactionsHistoryViewTableViewController.h"
#import "ListOfTransactions.h"
#import "ManagerControllerViewController.h"
#import "DetailsViewController.h"

@interface TransactionsHistoryViewTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic)UITableView* tableView;
@property (nonatomic)Transaction* selectedItem;
@end

@implementation TransactionsHistoryViewTableViewController

-(ListOfTransactions*)transactionsList{
    if(_transactionsList == nil){
        _transactionsList = [[ListOfTransactions alloc]init];
    }
    return _transactionsList;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return [self.transactionsList.Transactions count];
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"transaction1" forIndexPath:indexPath];
    Transaction* trns = [self.transactionsList.Transactions objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%10@, %7.2f * %3d, Total Amount: %7.2f",trns.ProductPurchased.ProductName,trns.ProductPurchased.Price,trns.QuantityPurchased,trns.TotalAmount];
    
    NSDateFormatter* dateFrmt = [[NSDateFormatter alloc]init];
    [dateFrmt setDateFormat:@"MMM dd,yyyy HH:mm:ss"];
    NSString* dateString = [dateFrmt stringFromDate:trns.currentDate];
    cell.detailTextLabel.text = dateString;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedItem = [[Transaction alloc]init];
    _selectedItem = [self.transactionsList.Transactions objectAtIndex:indexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"detailsSegue"]){
        DetailsViewController* detailsView = [segue destinationViewController];
        detailsView.selected_transaction = _selectedItem;
}
}


@end
