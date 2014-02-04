//
//  SFMovieDetailViewController.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 2/3/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFMovieDetailViewController.h"

@interface SFMovieDetailViewController ()

- (IBAction)dismissViewController:(id)sender;



@end

@implementation SFMovieDetailViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ratingsSliderInput:(id)sender {
    int threshold = [self.ratingSlider value] * 100;
    self.myRating.text = [[NSNumber numberWithInt:threshold] stringValue];
}
- (IBAction)dismissViewController:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
