//
//  QuizViewController.h
//  Quiz
//
//  Created by longwei su on 10/30/12.
//  Copyright (c) 2012 com.longwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController
{
    int currentQuestionIndex;
    
    NSMutableArray* questions;
    NSMutableArray* answers;
    
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}
//declaring methods
// Actions for the buttons to invoke
//connect controller and view objects
- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;

@end
