//
//  ViewController.m
//  3_4_16
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Product.h"
#import "CartDelegate.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource,CartDelegate>{
    
    NSArray *data;
    NSMutableArray *cart;
    
}


@property (weak, nonatomic) IBOutlet UITableView *table;


@end

@implementation ViewController

//Delegate Method

-(void)addItem:(id)sender{
    
    //제품 찾기
    
    UITableViewCell* cell = (UITableViewCell *)sender;
    
    NSIndexPath *indexPath = [_table indexPathForCell:cell];
    
    Product *item = data[indexPath.row];
    
    //카드에 상품 추가
    
    [cart addObject:item];
    
    //테이블 카트 섹션 리로드
    
    NSIndexSet* indexSet = [NSIndexSet indexSetWithIndex:1];
    
    [_table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (0 == section) {
        return [data count];
    }
    else
    {
        return [cart count];
        
    }
}



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return (0== section)?@"상품목록":@"카트";
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (0 == indexPath.section) {
        
        
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        
    //셀 내용 갱신
    
    Product *item = data[indexPath.row];
    
    [cell setProductInfo:item];
    
    
    //뷰컨트롤러가 셀의 델리게이트의 역할을 수행한다.
    
    cell.delegate = self;
    
    return cell;
    }
    else{
    
    UITableViewCell* cell= [tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        
    Product *item = cart[indexPath.row];
    
    cell.textLabel.text = item.name;
        
    return cell;

    }
    
}
    

- (void)viewDidLoad{
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
#if 1
    
    data = @[[ Product product:@"BaseBall"price:@"100"image:@"baseball.jpeg"],
             
    [Product product:@"BasketBall"price:@"200"image:@"basketball.png"],
    [Product product:@"FootBall"price:@"250"image:@"football.jpeg"],
    [Product product:@"RugbyBall"price:@"300"image:@"rugbyball.jpeg"],
    [Product product:@"Willson"price:@"999"image:@"volleyball.jpeg"]];
#endif
    cart = [[NSMutableArray alloc]init];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
