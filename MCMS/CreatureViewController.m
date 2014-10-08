//
//  CreatureViewController.m
//  MCMS
//
//  Created by Adam Cooper on 10/7/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *editCreatureButton;
@property (weak, nonatomic) IBOutlet UITextField *editCreatureTextField;
@property (strong, nonatomic) IBOutlet UIImageView *creatureImageView;


@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.creatures);
    self.editCreatureTextField.hidden = YES;
    self.creatureImageView.image = self.selectedCreature.creatureImage;
    NSLog(@"%@",self.selectedCreature.accessories);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onEditButtonPressed:(UIButton *)sender {
    if ([sender.titleLabel.text  isEqualToString: @"Edit"]) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.editCreatureTextField.hidden = NO;
        self.selectedCreature.name = self.editCreatureTextField.text;
    } else if ([sender.titleLabel.text  isEqualToString: @"Done"]){
        self.selectedCreature.name = self.editCreatureTextField.text;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.editCreatureTextField.hidden = YES;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.selectedCreature.accessories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"creatureCell"];
    NSString *accessory = [self.selectedCreature.accessories objectAtIndex:indexPath.row];
    cell.textLabel.text = accessory;
    return cell;
}





@end
