//
//  JECViewController.h
//  Calculator
//
//  Created by Joshua Cooper on 1/15/13.
//  Copyright (c) 2013 Joshua Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JECViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *Digits;
@property (weak, nonatomic) IBOutlet UIButton *ClearButton;
@property (weak, nonatomic) IBOutlet UIButton *LeftParens;
@property (weak, nonatomic) IBOutlet UIButton *RightParens;
@property (weak, nonatomic) IBOutlet UIButton *DivideButton;
@property (weak, nonatomic) IBOutlet UIButton *MultiplyButton;
@property (weak, nonatomic) IBOutlet UIButton *PlusButton;
@property (weak, nonatomic) IBOutlet UIButton *SubtractButton;
@property (weak, nonatomic) IBOutlet UIButton *EqualsButton;
@property (weak, nonatomic) IBOutlet UIButton *DecimalButton;
@property (weak, nonatomic) IBOutlet UIButton *NineButton;
@property (weak, nonatomic) IBOutlet UIButton *EightButton;
@property (weak, nonatomic) IBOutlet UIButton *SevenButton;
@property (weak, nonatomic) IBOutlet UIButton *SuxButton;
@property (weak, nonatomic) IBOutlet UIButton *FiveButton;
@property (weak, nonatomic) IBOutlet UIButton *FourButton;
@property (weak, nonatomic) IBOutlet UIButton *ThreeButton;
@property (weak, nonatomic) IBOutlet UIButton *TwoButton;
@property (weak, nonatomic) IBOutlet UIButton *OneButton;
@property (weak, nonatomic) IBOutlet UIButton *ZeroButton;
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UIButton *ExpButton;

- (IBAction)ninePressed:(UIButton *)sender;
- (IBAction)eightPressed:(UIButton *)sender;
- (IBAction)sevenPressed:(UIButton *)sender;
- (IBAction)sixPressed:(UIButton *)sender;
- (IBAction)fivePressed:(UIButton *)sender;
- (IBAction)fourPressed:(UIButton *)sender;
- (IBAction)threePressed:(UIButton *)sender;
- (IBAction)twoPressed:(UIButton *)sender;
- (IBAction)onePressed:(UIButton *)sender;
- (IBAction)zeroPressed:(UIButton *)sender;
- (IBAction)decimalPressed:(UIButton *)sender;
- (IBAction)clearPressed:(UIButton *)sender;
- (IBAction)divideButton:(UIButton *)sender;
- (IBAction)multPressed:(UIButton *)sender;
- (IBAction)subPressed:(UIButton *)sender;
- (IBAction)plusPressed:(UIButton *)sender;
- (IBAction)lParensPressed:(UIButton *)sender;
- (IBAction)rParensPressed:(UIButton *)sender;
- (IBAction)enterPressed:(UIButton *)sender;
- (IBAction)expPressed:(UIButton *)sender;

@end
