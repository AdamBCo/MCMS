//
//  BattleFieldViewController.m
//  MCMS
//
//  Created by Adam Cooper on 10/8/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "BattleFieldViewController.h"

@interface BattleFieldViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *creatureOneImage;
@property (weak, nonatomic) IBOutlet UIImageView *creatureTwoImage;
@property MagicalCreature *creatureOne;
@property MagicalCreature *creatureTwo;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;

@end

@implementation BattleFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.creatureOne = [self.battleCreatures objectAtIndex:0];
    self.creatureTwo= [self.battleCreatures objectAtIndex:1];
    
    self.creatureOneImage.image = self.creatureOne.creatureImage;
    self.creatureTwoImage.image = self.creatureTwo.creatureImage;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self letsGetStarted];
}

- (IBAction)onDoneButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)letsGetStarted
{
    MagicalCreature *winner = [self determineWinner:self.creatureOne andCreature:self.creatureTwo];
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionAutoreverse animations:^{
        self.creatureOneImage.center = CGPointMake(self.view.center.x-(self.creatureOneImage.frame.size.width/2), self.creatureOneImage.center.y);
        self.creatureTwoImage.center = CGPointMake(self.view.center.x+(self.creatureTwoImage.frame.size.width/2), self.creatureTwoImage.center.y);
        
    } completion:^(BOOL finished) {
        if (winner)
        {
            self.winnerLabel.text = [NSString stringWithFormat:@"WINNER: %@", winner.name];
        }
        else
        {
            self.winnerLabel.text = [NSString stringWithFormat:@"DRAW"];
        }
    }];
    
}

- (MagicalCreature *)determineWinner:(MagicalCreature *)creatureOne andCreature:(MagicalCreature *)creatureTwo
{
    NSInteger randomNumber = arc4random()%100;
    if (randomNumber < 50) {
        return creatureOne;
    } else if (randomNumber > 50){
        return creatureTwo;
    } else{
        return nil;
    }
}

@end

