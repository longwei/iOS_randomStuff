//
//  CardGameViewController.m
//  Matchismo
//
//  Created by longwei su on 6/16/13.
//  Copyright (c) 2013 Longwei Su. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) Deck* deck;
@end

@implementation CardGameViewController

- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    self.flipCount++;
}

- (void) setCardButtons:(NSArray *)cardButtons
{
    for (UIButton* cardButton in cardButtons) {
        Card* card = [self.deck drawRandomCard];
    }
}


- (void) setFlipCount:(int)flipCount
{
    _flipCount++;
    [self.flipsLabel setText:[NSString stringWithFormat:@"Flips: %d", _flipCount]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
