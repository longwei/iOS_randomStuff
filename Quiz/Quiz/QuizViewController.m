//
//  QuizViewController.m
//  Quiz
//
//  Created by longwei su on 10/30/12.
//  Copyright (c) 2012 com.longwei. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //call the super
    self = [ super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    {
        questions = [[NSMutableArray alloc] init];
        answers = [[NSMutableArray alloc] init];
        
        [questions addObject:@"what is 7+ 7"];
        [answers addObject:@"14"];
        
        [questions addObject:@"What is the capital of Vermont?"];
        [answers addObject:@"Montpelier"];
        
        [questions addObject:@"From what is cognac made?"];
        [answers addObject:@"Grapes"];
    }
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    currentQuestionIndex++;
    if(currentQuestionIndex == [questions count]){
        currentQuestionIndex = 0;
    }
    NSString *question = [questions objectAtIndex:currentQuestionIndex];
    NSLog(@("displaying question: %@"), questions);
    [questionField setText:question];
    [answerField setText:@"???"];
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer = [answers objectAtIndex:currentQuestionIndex];
    [answerField setText:answer];
}

@end
