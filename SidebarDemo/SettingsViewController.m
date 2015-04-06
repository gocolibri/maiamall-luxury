//
//  SettingsViewController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 04/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)setSwitchColourToFemale {
    self.femaleMaleSwitch.tintColor = femaleColor;
    self.femaleMaleSwitch.backgroundColor = femaleColor;
    self.femaleMaleSwitch.layer.cornerRadius = 16.0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.tabBarController.delegate = self;

    [self setSwitchColourToFemale];
}

- (void)viewDidAppear:(BOOL)animated {
    bool maleFemale = [[NSUserDefaults standardUserDefaults] boolForKey:kFemaleOrMaleSwitch];
    [self setSwitchTo:maleFemale];
}

- (void)setSwitchColourToMale {
    self.femaleMaleSwitch.tintColor = femaleColor;
    self.femaleMaleSwitch.backgroundColor = femaleColor;
    self.femaleMaleSwitch.layer.cornerRadius = 16.0;
}

- (void)setSwitchTo:(BOOL)on {
    if (on) {
        [self setSwitchColourToFemale];
    } else {
        [self setSwitchColourToMale];
    }
    [self.femaleMaleSwitch setOn:on];
}

- (IBAction)switchChanged:(UISwitch *)sender {
    
    [self setSwitchTo:sender.isOn];
    
    [[NSUserDefaults standardUserDefaults] setBool:sender.isOn forKey:kFemaleOrMaleSwitch];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [_delegate genderWasChangedFrom:[[NSUserDefaults standardUserDefaults] boolForKey:kFemaleOrMaleSwitch] to:sender.isOn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (item.tag == 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"profileNav"];
        
        [self showViewController:map sender:self];
        
    } else if (item.tag == 1) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"mapNav"];
        
        [self showViewController:map sender:self];
    } else if (item.tag == 2) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"homeNav"];
        
        [self showViewController:map sender:self];
        // [item setEnabled:YES];
        
    } else if (item.tag == 3) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        UINavigationController *map = [storyboard instantiateViewControllerWithIdentifier:@"blogNav"];
        
        // [self performSegueWithIdentifier:@"mapNav" sender:self];
        
        [self showViewController:map sender:self];
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
