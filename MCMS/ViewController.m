//
//  ViewController.m
//  MCMS
//
//  Created by Adam Cooper on 10/7/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
#import "BattleFieldViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *enterCreature;
@property (weak, nonatomic) IBOutlet UITableView *creaturesTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.enterCreature.delegate = self;
    MagicalCreature *unicorn = [[MagicalCreature alloc]initWithName:@"Magical Mary"];
    unicorn.favoriteMusic = @"Hip Hop";
    unicorn.creatureImage = [UIImage imageNamed:@"Unicorn"];
    unicorn.accessories = [NSMutableArray arrayWithObjects:@"Cane",@"Capulana", @"Card enclosure", @"Caul (headgear)", @"Chatelaine (chain)", @"Chemisette", @"Cheopji", @"Cigarette case", @"Cigarette holder", @"Collar pin", @"Compact (cosmetics)", @"Corsage", @"Cufflink", @"Cummerbund", nil];
    MagicalCreature *snail = [[MagicalCreature alloc]initWithName:@"Herman"];
    snail.favoriteMusic = @"Techno";
    snail.creatureImage = [UIImage imageNamed:@"snail"];
    snail.accessories = [NSMutableArray arrayWithObjects:@"Hair drop", @"Hair stick", @"Hairnet", @"Hand cooler", @"Handkerchief", nil];
    MagicalCreature *pokemon = [[MagicalCreature alloc]initWithName: @"Pikachu"];
    pokemon.favoriteMusic = @"Jazz";
    pokemon.creatureImage  = [UIImage imageNamed:@"pikachu"];
    pokemon.accessories = [NSMutableArray arrayWithObjects:@"Metal clay",@"Minaudière", @"Mobile phone charm",@"Money clip", @"Muff (handwarmer)", nil];
    MagicalCreature *cow = [[MagicalCreature alloc]initWithName: @"Holy Cow"];
    cow.favoriteMusic = @"Groovy Moosic";
    cow.creatureImage = [UIImage imageNamed:@"cow"];
    cow.accessories = [NSMutableArray arrayWithObjects:@"Pin-back button", @"Pocket protector", @"Presidential sash", @"Purse cover from Sutton Hoo burial",@"Purse hook", nil];
    self.creatures = [NSMutableArray arrayWithObjects: unicorn, snail, pokemon, cow, nil];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.creaturesTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell
{
    if ([segue.identifier isEqualToString:@"ShowCreatureSegue"])
    {
        CreatureViewController *creatureViewController = segue.destinationViewController;
        creatureViewController.navigationItem.title = cell.textLabel.text;
        creatureViewController.selectedCreature = [self.creatures objectAtIndex:[self.creaturesTableView indexPathForCell:cell].row];
    }
    else if ([segue.identifier isEqualToString:@"BattleSegue"])
    {
        BattleFieldViewController *battleFieldViewController = segue.destinationViewController;
        battleFieldViewController.battleCreatures = self.battleCreatures;
        [self.creaturesTableView setEditing:NO animated:YES];
    }
}


- (IBAction)onBattleButtonPressed:(id)sender {
    self.battleCreatures = [[NSMutableArray alloc] init];
    
    if ([self.creaturesTableView isEditing]) {
        self.creaturesTableView.allowsMultipleSelection = YES;
        [self.creaturesTableView setEditing:NO animated:YES];
    } else {
        [self.creaturesTableView setEditing:YES animated:YES];
    }
}


- (IBAction)onAddCreatureButtonPressed:(UIButton *)sender {
    MagicalCreature *newCreature = [[MagicalCreature alloc] initWithName:self.enterCreature.text];
    [self.creatures addObject: newCreature];
    self.enterCreature.text = @"";
    [self.enterCreature resignFirstResponder];
    [self.creaturesTableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"theMagicalCreaturesID" forIndexPath:indexPath];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.favoriteMusic;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.creaturesTableView isEditing]) {
        if (self.battleCreatures.count <2) {
            [self.battleCreatures addObject:[self.creatures objectAtIndex:indexPath.row]];
        }
        if (self.battleCreatures.count ==2) {
            
            [self performSegueWithIdentifier:@"BattleSegue" sender:self];
        }
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"ShowCreatureSegue"] && [self.creaturesTableView isEditing])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}


@end
