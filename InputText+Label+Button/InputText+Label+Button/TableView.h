//
//  TableView.h
//  InputText+Label+Button
//
//  Created by Vishal Kumar on 22/02/17.
//  Copyright © 2017 Training. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface TableView : UIViewController <UITableViewDelegate, UITableViewDataSource, ViewControllerDelegate>


@property (strong, nonatomic) IBOutlet UITableView *detailTableView;

@property(nonatomic) NSMutableArray *itemsArray;

@property(atomic)BOOL isAdded;


@end
