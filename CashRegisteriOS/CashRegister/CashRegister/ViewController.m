//Svetlana Molodtsova
//  ViewController.m
//  CashRegister
//  Copyright © 2017 seneca. All rights reserved.
//

#import "ViewController.h"
#import "ListOfProducts.h"
#import "ListOfTransactions.h"
#import "ManagerControllerViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *ProductsPickerView;
@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy;
@property (weak, nonatomic) IBOutlet UIButton *btnManagersView;
@property (weak, nonatomic) IBOutlet UILabel *lblProduct;
@property (weak, nonatomic) IBOutlet UILabel *lblQuantity;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblTotal;
@property (weak, nonatomic) IBOutlet UILabel *lblSuccess;
@property (weak, nonatomic) IBOutlet UIButton *btnClear;
@property (nonatomic)ListOfProducts* myList;
@property (nonatomic)ListOfTransactions* transactionsList;
@property (nonatomic)Product* selectedProduct;
@property int selectedIndex;
@property NSInteger qty;
@property  double total;
@property NSString* myNumberString;
@property NSDate* currentDate;
@end

@implementation ViewController
-(ListOfProducts*)myList
{
     if (_myList == nil) {
        _myList = [[ListOfProducts alloc]init];
    }
    return _myList;
}
-(ListOfTransactions*)transactionsList{
    if(_transactionsList == nil){
        _transactionsList = [[ListOfTransactions alloc]init];
    }
    return _transactionsList;
}

- (IBAction)btnPressed:(UIButton*)sender {
    if(_selectedIndex >= 0){
    NSString* temp = sender.currentTitle;
    _myNumberString = [_myNumberString stringByAppendingString:temp];
    _qty = [_myNumberString integerValue];
    if(_qty <= _selectedProduct.QuantityOnHand){
            self.lblQuantity.text = _myNumberString;
            _total = _qty * _selectedProduct.Price;
    self.lblTotal.text = [NSString stringWithFormat:@"%0.2f",_total];
            }
    else{
            self.lblQuantity.text = @"Error: no product quantity on hand";
            self.lblTotal.text =  @"0.0";
            _myNumberString =@"";
            }
    }
    else{
        self.lblProduct.text = @"no product is selected";
    }
    

    
   
}
- (IBAction)btnClear_Pressed:(UIButton *)sender{
    self.lblQuantity.text = @"";
    self.lblTotal.text = @"";
    self.lblPrice.text = @"";
    self.lblProduct.text = @"";
    self.lblSuccess.text = @"";
    _myNumberString = @"";
    _qty = 0;
    _total = 0.0;
    _selectedIndex = -1;
}
- (IBAction)btnPurchase_Pressed:(UIButton *)sender {
    if(_qty <= _selectedProduct.QuantityOnHand){
        self.lblSuccess.text = [NSString stringWithFormat:@"Product: %@, %d * %0.2f, Total: %0.2f",_selectedProduct.ProductName,(int)_qty,_selectedProduct.Price,_total];
        self.lblProduct.text = @"";
        self.lblPrice.text = @"";
        self.lblTotal.text = @"";
        self.lblQuantity.text =@"";
        _selectedProduct.QuantityOnHand -=(int) _qty;
        [_ProductsPickerView reloadAllComponents];
        Transaction* trn = [[Transaction alloc]initWithValues:_selectedProduct QuantityPurchased:_qty TotalAmount:_total];
        [self.transactionsList.Transactions addObject:trn];
        _qty = 0;
        _total = 0.0;
        _myNumberString = @"";
        _selectedIndex = -1;
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ForManager"]){
        ManagerControllerViewController* mngr = [segue destinationViewController];
        mngr.trnsList = self.transactionsList;
        mngr.productsList = self.myList;
        
    }
    
}
-(IBAction)btnManagersView_Pressed:(id)sender {
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger rows_count =  0;
    rows_count = [self.myList.Products  count];
    return rows_count;
}
-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    _selectedProduct = [self.myList.Products objectAtIndex:row];
    NSString* ProductLine = [NSString stringWithFormat:@"%@, %0.2f, Qty: %d",_selectedProduct.ProductName,_selectedProduct.Price,_selectedProduct.QuantityOnHand];
     return ProductLine;
    
}
-(void)pickerView:(UIPickerView*)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView == _ProductsPickerView){
    self.lblProduct.text = @"";
    self.lblPrice.text = @"";
    self.lblSuccess.text = @"";
    self.lblQuantity.text = @"";
    self.lblTotal.text = @"";
    _qty = 0;
    _total = 0.0;
    _myNumberString = @"";
    _selectedProduct = [self.myList.Products objectAtIndex:row];
    _selectedIndex = (int)row;
    self.lblProduct.text = [NSString stringWithFormat: @"%@, %@",_selectedProduct.ProductName,_selectedProduct.ProductDescription];
    self.lblPrice.text = [NSString stringWithFormat:@"%0.2f",_selectedProduct.Price];
    
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _myNumberString = [[NSString alloc]init];
    _selectedProduct = [[Product alloc]init];
    _selectedIndex = -1;
    _qty = 0;
    _total = 0.0;
    _currentDate = [NSDate date];
    NSDateFormatter* dateFrmt = [[NSDateFormatter alloc]init];
    [dateFrmt setDateFormat:@"MMM dd,yyyy HH:mm:ss"];
    NSString* dateString = [dateFrmt stringFromDate:_currentDate];
    self.lblSuccess.text = dateString;
    Product* temp;
    temp = [[Product alloc]initWithValues:@"pants" ProductDescription:@"blue jeans" Category:@"men apparel" Price:100.00 Quantity:10];
    [self.myList.Products addObject:temp];
    temp = [[Product alloc]initWithValues:@"shirts" ProductDescription:@"long sleeved, cotton" Category:@"men apparel" Price:99.00 Quantity:50];
    [self.myList.Products addObject:temp];
    temp = [[Product alloc]initWithValues:@"shoes" ProductDescription:@"leather" Category:@"men shoes" Price:100.00 Quantity:30];
    [self.myList.Products addObject:temp];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
