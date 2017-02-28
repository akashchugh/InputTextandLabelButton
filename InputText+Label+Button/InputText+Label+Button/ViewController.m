//
//  ViewController.m
//  InputText+Label+Button
//
//  Created by Vishal Kumar on 21/02/17.
//  Copyright © 2017 Training. All rights reserved.
//

#import "ViewController.h"
#import "DataSet.h"

@class TableView;

@interface ViewController ()

@end

@implementation ViewController

@synthesize nametextField,label,numtextField,emailtextField,concattextField;



- (void)viewDidLoad {
    [super viewDidLoad];
    if (_isItemSelected) {
        DataSet* data = (DataSet*)[_itemsArray objectAtIndex:_selectedIndex];
        nametextField.text = data.name;
        numtextField.text = data.number;
        emailtextField.text = data.email;
    }
   
}
-(void)viewWillDisappear:(BOOL)animated{
    
    self.isItemSelected = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL) validEmail:(NSString*) emailString {
    
    if([emailString length]==0){
        return NO;
    }
    
    NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    
    
    NSLog(@"%lu", regExMatches);
    if (regExMatches == 0) {
        return NO;
    }
    else {
        return YES;
    }
}
- (BOOL)validateMobileNumber:(NSString*)number
{
    NSString *numberRegEx = @"[0-9]{10}";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegEx];
    if ([numberTest evaluateWithObject:number] == YES)
        return TRUE;
    else
//        submit.enabled = NO;
        return false;
}
//- (BOOL)validateMobileNumber:(NSString *)aString
//{
//    
//    if ([[NSNumberFormatter new] numberFromString:aString] != nil || aString.length == 10) {
//        return true;
//    } else {
//        return false;
//    }

    
//    NSString * const regularExpression = @"^([+-]{1})([0-9]{3})$";
//    NSError *error = NULL;
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularExpression
//                                                                           options:NSRegularExpressionCaseInsensitive
//                                                                             error:&error];
//    if (error) {
//        NSLog(@"error %@", error);
//    }
//    
//    NSUInteger numberOfMatches = [regex numberOfMatchesInString:aString
//                                                        options:0
//                                                          range:NSMakeRange(0, [aString length])];
//    return numberOfMatches > 0;
//}

- (IBAction)submit:(id)sender {
    
   NSString *input = [NSString stringWithFormat:@"Name:%@  Mobile:%@  Email:%@", nametextField.text, numtextField.text, emailtextField.text];
    if (![self validEmail:emailtextField.text]) {
        NSLog(@"Please Enter a Valid Email.");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incorrect Email Id"
                                                        message:@"Please enter correct Email Id."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else
    if (![self validateMobileNumber:numtextField.text]) {
         NSLog(@"Please Enter a Valid Mobile Number.");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incorrect Mobile number"
                                                        message:@"Please enter correct Mobile Number."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{
            
        if (_isItemSelected) {
            
            [_itemsArray replaceObjectAtIndex:_selectedIndex withObject:[[DataSet alloc]initWithName:nametextField.text email:emailtextField.text number:numtextField.text]];
            [self.delegate dataFromController:true];
            [self dismissModalViewControllerAnimated: YES];
            
        } else {
            DataSet* set = [[DataSet alloc]initWithName:nametextField.text email:emailtextField.text number:numtextField.text];
            
            [_itemsArray addObject:set];
            [self.delegate dataFromController:true];
            
            concattextField.text=input;
            NSLog(@"%@",input );
            
            [self dismissModalViewControllerAnimated: YES];
        }

        }
    
    
//    DataSet* objectUpdate=[self.itemsArray objectAtIndex:indexPath.row];
//    Cell.nametextField.text=objectUpdate.name;
//    Cell.numtextField.text=objectUpdate.number;
//    Cell.emailtextField.text=objectUpdate.email;
//
    
    }

@end
