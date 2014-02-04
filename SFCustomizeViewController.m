//
//  SFCustomizeViewController.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 2/3/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFCustomizeViewController.h"

@interface SFCustomizeViewController ()
- (IBAction)dismissViewController:(id)sender;

@property (nonatomic) NSUserDefaults *prefs;

@end

@implementation SFCustomizeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _prefs = [NSUserDefaults standardUserDefaults];
    self.gpsButton.backgroundColor = [UIColor redColor];
    self.gpsButton.tintColor = [UIColor whiteColor];
    
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"distanceThreshold"]);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)distanceThresholdSliderAction:(id)sender {
    int threshold = [self.distanceThresholdSliderOutlet value] * 20;
    self.distanceThresholdLabel.text = [[NSNumber numberWithInt:threshold] stringValue];
    [_prefs setInteger:threshold forKey:@"distanceThreshold"];
}

- (IBAction)criticsRatingThresholdSliderAction:(id)sender {
    int threshold = [self.criticsThresholdSliderOutlet value] * 100;
    self.criticsRatingThresholdLabel.text = [[NSNumber numberWithInt:threshold] stringValue];
    [[NSUserDefaults standardUserDefaults] setInteger:threshold forKey:@"criticThreshold"];

}

- (IBAction)audienceRatingThresholdSliderAction:(id)sender {
    int threshold = [self.audienceRatingSliderOutlet value] * 100;
    self.audienceRatingThresholdLabel.text = [[NSNumber numberWithInt:threshold] stringValue];
    [[NSUserDefaults standardUserDefaults] setInteger:threshold forKey:@"audienceThreshold"];

}
- (IBAction)gpsButtonAction:(id)sender {
}
- (IBAction)dismissViewController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end