//
//  TableView.m
//  InputText+Label+Button
//
//  Created by Vishal Kumar on 22/02/17.
//  Copyright © 2017 Training. All rights reserved.
//

#import "TableView.h"
#import "ViewController.h"
#import "DataSet.h"


@interface TableView ()
{
    BOOL isSelected;
    int selectedRow;
}
@end


@implementation TableView

@synthesize itemsArray,isAdded;



-(void)viewWillAppear:(BOOL)animated{
    isSelected = false;
    if (isAdded) {
        [_detailTableView reloadData];
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
  
    DataSet* obj1 = [[DataSet alloc]initWithName:@"Akash" email:@"email" number:@"12342435"];
    DataSet* obj2 = [[DataSet alloc]initWithName:@"Rohit" email:@"email" number:@"12342435"];
    DataSet* obj3 = [[DataSet alloc]initWithName:@"Pritam" email:@"email" number:@"12342435"];
    DataSet* obj4 = [[DataSet alloc]initWithName:@"Dheeraj" email:@"email" number:@"12342435"];
       itemsArray = [[NSMutableArray alloc] initWithObjects:obj1, obj2,obj3, obj4,nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [itemsArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    DataSet *item =(DataSet*)[itemsArray objectAtIndex:[indexPath row]];
    
    UILabel *name = (UILabel *)[cell viewWithTag:1];
    UILabel *number = (UILabel *)[cell viewWithTag:2];
    UILabel *email = (UILabel *)[cell viewWithTag:3];
    
    name.text = item.name;
    number.text = item.number;
    email.text = item.email;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedRow = indexPath.row;
    isSelected = true;
    [self performSegueWithIdentifier:@"ShowDetail" sender:tableView];
}

- (void)dataFromController:(BOOL)isChanged;
{
    
    isAdded = isChanged;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        ViewController *ViewController = segue.destinationViewController;
    ViewController.isItemSelected = isSelected;
    ViewController.selectedIndex = selectedRow;
        ViewController.itemsArray = itemsArray;
        ViewController.delegate = self;
    
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        //Do something
//        Detail *detailController = (Detail*)segue.destinationViewController;
    }
}

//- (void)passDataForward
//{
//    ViewController *ViewController = [[ViewController alloc] init];
//    ViewController.itemsArray = itemsArray;
//    ViewController.delegate = self;
//    [self.navigationController pushViewController:ViewController animated:YES];
//}



/*
- (IBAction)addAction:(id)sender {
 
    ViewController* vc = [[ViewController alloc]init];
    vc.dataSet = itemsArray;
    [self.navigationController pushViewController:vc animated:true];
}

*/
@end

