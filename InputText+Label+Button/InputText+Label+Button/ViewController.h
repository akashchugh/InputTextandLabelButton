//
//  ViewController.h
//  InputText+Label+Button
//
//  Created by Vishal Kumar on 21/02/17.
//  Copyright © 2017 Training. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ViewControllerDelegate <NSObject>
@required
- (void)dataFromController:(BOOL)itemsArray;
@end


@interface ViewController : UIViewController <UITextViewDelegate , UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UITextField *nametextField;
@property (strong, nonatomic) IBOutlet UITextField *numtextField;
@property (strong, nonatomic) IBOutlet UITextField *emailtextField;
@property (strong, nonatomic) IBOutlet UITextField *concattextField;

@property(atomic) BOOL isItemSelected;
@property(atomic) int selectedIndex;

@property (nonatomic) NSMutableArray * itemsArray;
@property (nonatomic, weak) id<ViewControllerDelegate> delegate;

-(BOOL)validateMobileNumber:(NSString *)aString;
- (BOOL) validEmail:(NSString*) emailString;
- (IBAction)submit:(id)sender;


@end

