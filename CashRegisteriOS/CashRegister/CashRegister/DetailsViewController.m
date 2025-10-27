//
//  DetailsViewController.m
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblDetails;
@property (weak, nonatomic) IBOutlet UILabel *lblProductDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblProductCategory;
@property (weak, nonatomic) IBOutlet UILabel *lblProductPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblQuantityPurchased;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalAmount;
@end

@implementation DetailsViewController
/*
-(Transaction*)selected_transaction{
    if(_selected_transaction == nil){
        _selected_transaction = [[Transaction alloc]init];
    }
    return _selected_transaction;
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblDetails.text = self.selected_transaction.ProductPurchased.ProductName;
    self.lblProductDescription.text = self.selected_transaction.ProductPurchased.ProductDescription;
    self.lblProductCategory.text = self.selected_transaction.ProductPurchased.Category;
    self.lblProductPrice.text = [NSString stringWithFormat:@"Price: %0.2f", self.selected_transaction.ProductPurchased.Price];
    self.lblQuantityPurchased.text = [NSString stringWithFormat:@"Quantity purchased: %d", self.selected_transaction.QuantityPurchased];
    self.lblTotalAmount.text = [NSString stringWithFormat:@"Total Amount: %0.2f", self.selected_transaction.TotalAmount];
    
}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
