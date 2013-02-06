//
//  JECViewController.m
//  Calculator
//
//  Created by Joshua Cooper on 1/15/13.
//  Copyright (c) 2013 Joshua Cooper. All rights reserved.
//

#import "JECViewController.h"

@interface JECViewController ()
@end

@implementation JECViewController

NSString *initial = @"";
NSString *clear = @"";
NSMutableString *input;
//boolean flags denote whether this type of character will be valid
bool decimal;
bool operand;
bool digits;
bool leftParens;
bool rightParens;
bool divisionByZero = false;
bool resultOnScreen = false;
//check if parens are balanced, should equal 0 at the end
int parensBalance = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    rightParens = false;
    operand = false;
    decimal = true;
    digits = true;
    leftParens = true;
    input = [NSMutableString stringWithString: initial];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *pattern = [UIImage imageNamed:@"retina_wood.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:pattern];
    self.Digits.textColor = [UIColor blueColor];
    self.Digits.font=[UIFont fontWithName:@"Let's go Digital" size:30];
    self.Digits.backgroundColor = [UIColor clearColor];
    self.Digits.text = input;
    self.Title.backgroundColor = [UIColor clearColor];
    self.ClearButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.DivideButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.MultiplyButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.SubtractButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.PlusButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.EqualsButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.LeftParens.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.RightParens.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.DecimalButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.ExpButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.NineButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.EightButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.SevenButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.SuxButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.FiveButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.FourButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.ThreeButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.TwoButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.OneButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];
    self.ZeroButton.titleLabel.font=[UIFont fontWithName:@"Let's go Digital" size:27];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDigits:nil];
    [self setClearButton:nil];
    [self setDivideButton:nil];
    [self setPlusButton:nil];
    [self setEqualsButton:nil];
    [self setDecimalButton:nil];
    [self setNineButton:nil];
    [self setEightButton:nil];
    [self setSevenButton:nil];
    [self setSuxButton:nil];
    [self setFiveButton:nil];
    [self setFourButton:nil];
    [self setThreeButton:nil];
    [self setTwoButton:nil];
    [self setOneButton:nil];
    [self setZeroButton:nil];
    [self setTitle:nil];
    [self setDivideButton:nil];
    [self setMultiplyButton:nil];
    [self setPlusButton:nil];
    [self setSubtractButton:nil];
    [self setLeftParens:nil];
    [self setRightParens:nil];
    [self setExpButton:nil];
    [super viewDidUnload];
}

-(bool) isOperator:(char) c{
    return (c == '+' || c == '/' || c == '*' || c == '-' || c == '^');
}

-(void) digitPressed:(NSString *)digit{
    if(resultOnScreen){
        [input setString: @""];
        resultOnScreen = false;
    }
    int length = [input length];
    if(length < 19 && digits){
        [input appendString:digit];
        self.Digits.text = input;
        leftParens = false;
        rightParens = true;
        operand = true;
        digits = true;
        
    }
}

-(void) operandPressed:(NSString *)type{
    resultOnScreen = false;
    int length = [input length];
    if(length < 18 && operand){
        [input appendString:type];
        operand = false;
        self.Digits.text = input;
        leftParens = true;
        rightParens = false;
        digits = true;
        decimal = true;
    }
}

- (IBAction)ninePressed:(UIButton *)sender {
    [self digitPressed:@"9"];
}

- (IBAction)eightPressed:(UIButton *)sender {
 [self digitPressed:@"8"];
}

- (IBAction)sevenPressed:(UIButton *)sender {
    [self digitPressed:@"7"];
}

- (IBAction)sixPressed:(UIButton *)sender {
    [self digitPressed:@"6"];
}

- (IBAction)fivePressed:(UIButton *)sender {
    [self digitPressed:@"5"];
}

- (IBAction)fourPressed:(UIButton *)sender {
    [self digitPressed:@"4"];
}

- (IBAction)threePressed:(UIButton *)sender {
    [self digitPressed:@"3"];
}

- (IBAction)twoPressed:(UIButton *)sender {
    [self digitPressed:@"2"];
}

- (IBAction)onePressed:(UIButton *)sender {
   [self digitPressed:@"1"];
}

- (IBAction)zeroPressed:(UIButton *)sender {
   [self digitPressed:@"0"];
}

- (IBAction)decimalPressed:(UIButton *)sender {
    if(resultOnScreen){
        [input setString: @"0"];
        resultOnScreen = false;
        decimal = true;
        digits = true;
    }
    int length = [input length];
    if(length == 0){
        [input appendString:@"0"];
        [input appendString:@"."];
        self.Digits.text = input;
        rightParens = true;
        operand = true;
        digits = true;
        leftParens = false;
        decimal = false;
    }
    if(length < 19 && decimal && digits){
        if([self isOperator:[input characterAtIndex:length -1]]){
            [input appendString:@"0"];
            [input appendString:@"."];}
        else{
            [input appendString:@"."];
        }
    
        self.Digits.text = input;
        rightParens = true;
        operand = true;
        digits = true;
        leftParens = false;
        decimal = false;
    }
}

- (IBAction)clearPressed:(UIButton *)sender {
    rightParens = false;
    operand = false;
    decimal = true;
    digits = true;
    leftParens = true;
    parensBalance = 0;
    input = [NSMutableString stringWithString: initial];
    self.Digits.text = clear;
}

- (IBAction)divideButton:(UIButton *)sender {
    [self operandPressed:@"/"];
}

- (IBAction)plusPressed:(UIButton *)sender {
    [self operandPressed:@"+"];
}

- (IBAction)multPressed:(UIButton *)sender {
    [self operandPressed:@"*"];
}

- (IBAction)subPressed:(UIButton *)sender {
   [self operandPressed:@"-"];
}

- (IBAction)expPressed:(UIButton *)sender {
    [self operandPressed:@"^"];
}
- (IBAction)lParensPressed:(UIButton *)sender {
    if(resultOnScreen){
        [input setString: @""];
        resultOnScreen = false;
    }
    int length = [input length];
    if(leftParens && length < 17){
        [input appendString:@"("];
        self.Digits.text = input;
        rightParens = false;
        operand = false;
        decimal = true;
        digits = true;
        leftParens = true;
        parensBalance++;
    }
}
- (IBAction)rParensPressed:(UIButton *)sender {
    if(rightParens && parensBalance > 0){
        [input appendString:@")"];
        self.Digits.text = input;
        rightParens = true;
        operand = true;
        digits = false;
        leftParens = false;
        parensBalance--;
    }
}


-(NSMutableArray *) makeOperationsArray:(NSMutableString *)input{
    NSMutableArray *operations = [NSMutableArray array];
    int tracker = 0;
    int length = [input length];
    for(int i = 0; i < length; i++){
        char c = [input characterAtIndex:i];
        bool operator = [self isOperator:c];
        if(operator || i == length -1){
            NSRange range;
            if(i == length - 1){
              range = NSMakeRange(tracker, i-tracker+1);
            }
            else{
              range = NSMakeRange(tracker, i-tracker);     
            }
        NSString *term = [input substringWithRange:range];
            tracker = i + 1;
            [operations addObject:term];
            if(operator){
                range = NSMakeRange(i, 1);
                term = [input substringWithRange:range];
                [operations addObject:term];
            }
        }
    }
    return operations;
    
}

//truncates exponent
-(int) take:(double) base toExponent:(int) exponent{
    int returnVal = 1;
    for(int i = 0; i < exponent; i++){
        returnVal = returnVal * base;
    }
    return returnVal;
}

-(void) resolveMutableArray:(NSMutableArray *)input byOperatorType:(NSString*) operatorType{
    NSUInteger index = [input indexOfObject:operatorType];
    if(index == NSNotFound){
        return;
    }
    double operand1 = [[input objectAtIndex:(index-1)] doubleValue];
    double operand2 = [[input objectAtIndex:(index+1)] doubleValue];
    double result;
    if([operatorType compare:@"+"]==NSOrderedSame){
        result = operand1 + operand2;
    }
    else if([operatorType compare:@"-"]==NSOrderedSame){
        result = operand1 - operand2;
    }
    else if([operatorType compare:@"*"]==NSOrderedSame){
        result = operand1 * operand2;
    }
    else if ([operatorType compare:@"/"] == NSOrderedSame){
        if(operand2 == 0){
            divisionByZero = true;
            return;
        }
        result = operand1 / operand2;
    }
    else if ([operatorType compare:@"^"] == NSOrderedSame){
        if(operand2 == 0 && operand2 == 0){
            divisionByZero = true;
            return;
        }
        result = [self take:operand1 toExponent:operand2];
    }
    else{
        return;
    }
    NSString *newVal = [[NSNumber numberWithDouble:result] stringValue];
    [input insertObject:newVal atIndex:index];
    [input removeObjectAtIndex:index + 2];
    [input removeObjectAtIndex:index+1];
    [input removeObjectAtIndex:index - 1];    
    [self resolveMutableArray:input byOperatorType:operatorType];
}

-(NSMutableString *) resolveString:(NSMutableString *)input{
    //first check to deal with parentheses
        NSRange left = [input rangeOfString:@"("];
        if(left.location!=NSNotFound){
        NSRange right = [input rangeOfString:@")" options:NSBackwardsSearch];
        NSRange outParens = NSMakeRange(left.location, right.location-left.location+1);
        NSRange inParens = NSMakeRange(left.location+1, right.location-left.location-1);
        NSString * subString = [input substringWithRange:inParens];
        NSMutableString *fromParens = [NSMutableString stringWithString:subString];
        NSMutableString *resolved = [self resolveString:fromParens];
        NSString *newString = [input stringByReplacingCharactersInRange:outParens withString:resolved];
       input = [NSMutableString stringWithString:newString];
    }
    //when we are here, there are not parentheses in the expression so we follow EMDAS
    NSMutableArray *operators = [self makeOperationsArray:input];
    [self resolveMutableArray:operators byOperatorType:@"^"];
    if(divisionByZero){
        divisionByZero = false;
        return [NSMutableString stringWithString: @"Div by 0"];
    }
    [self resolveMutableArray:operators byOperatorType:@"*"];
    [self resolveMutableArray:operators byOperatorType:@"/"];
    if(divisionByZero){
        divisionByZero = false;
        return [NSMutableString stringWithString: @"Div by 0"];
    }
    [self resolveMutableArray:operators byOperatorType:@"+"];
    [self resolveMutableArray:operators byOperatorType:@"-"];
    return [operators objectAtIndex:0];
}

- (IBAction)enterPressed:(UIButton *)sender {
    if(resultOnScreen){
        return;
    }
    rightParens = false;
    operand = true;
    decimal = true;
    digits = true;
    leftParens = false;
    decimal = false;
    if(parensBalance != 0){
        operand = false;
        digits = false;
        input = [NSMutableString stringWithString: @"Error"];
        self.Digits.text = input;
    }
    else{
        input =[NSMutableString stringWithString: [self resolveString:input]];
        resultOnScreen = true;
        self.Digits.text = input;
    }
}







@end
