//
//  ViewController.m
//  Calculator
//
//  Created by Brendan Coneys on 1/31/15.
//  Copyright (c) 2015 Brendan Coneys. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;

@property (nonatomic, strong) CalculatorBrain *brain;

@end

@implementation ViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{

    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;

}

- (IBAction)digitPressed:(UIButton *)sender
{

    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        
        self.display.text = [self.display.text stringByAppendingString:digit];
        
        
      //  self.display.text = [self.display.text stringByAppendingString:digit];

    }
    else
    {
    
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    
    }
}

- (IBAction)enterPressed
{

    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;

}

- (IBAction)opperationPressed:(UIButton *)sender
{

    if (self.userIsInTheMiddleOfEnteringANumber)
    {

        [self enterPressed];
    
    }
    
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];

}

@end
