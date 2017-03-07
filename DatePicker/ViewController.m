//
//  ViewController.m
//  DatePicker
//
//  Created by Suresh on 2/16/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    [self.datePicker setMaximumDate:[NSDate date]];
    
    
    [self.datePicker addTarget:self action:@selector(textFieldUpdate) forControlEvents:UIControlEventValueChanged];
    
    [self.txtField setInputView:self.datePicker];
    
    self.datePicker.hidden = YES;
    
    NSDateFormatter *dateformat = [[NSDateFormatter alloc]init];
    
    [dateformat setDateStyle:NSDateFormatterMediumStyle];
    
    [dateformat setDateFormat:@"YYYY-MM-dd"];
    
    
    self.txtField.text = [NSString stringWithFormat:@"%@",[dateformat stringFromDate:[NSDate date]]];
    self.todayDate.text = [NSString stringWithFormat:@"%@",[dateformat stringFromDate:[NSDate date]]];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    self.datePicker.hidden = NO;
    
    
    [textField resignFirstResponder];
    return NO;
}
-(void)textFieldUpdate{
    //self.datePicker = (UIDatePicker*)self.txtField.inputView;
    
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"YYYY-MM-dd"];
    
    self.txtField.text = [NSString stringWithFormat:@"%@",[format stringFromDate:self.datePicker.date]];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.datePicker.hidden = YES;
}

@end
