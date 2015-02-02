//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Brendan Coneys on 1/31/15.
//  Copyright (c) 2015 Brendan Coneys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;

- (double)performOperation:(NSString *)operation;
@end