//
//  SFCustomizeViewController.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 2/3/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFCustomizeViewController.h"

@interface SFCustomizeViewController ()

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
    self.gpsButton.backgroundColor = [UIColor redColor];
    self.gpsButton.tintColor = [UIColor whiteColor];
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
}

- (IBAction)criticsRatingThresholdSliderAction:(id)sender {
    int threshold = [self.criticsThresholdSliderOutlet value] * 100;
    self.criticsRatingThresholdLabel.text = [[NSNumber numberWithInt:threshold] stringValue];
}

- (IBAction)audienceRatingThresholdSliderAction:(id)sender {
    int threshold = [self.audienceRatingSliderOutlet value] * 100;
    self.audienceRatingThresholdLabel.text = [[NSNumber numberWithInt:threshold] stringValue];
}
- (IBAction)gpsButtonAction:(id)sender {
}
@end
