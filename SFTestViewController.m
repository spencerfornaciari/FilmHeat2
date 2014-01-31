//
//  SFTestViewController.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/30/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFTestViewController.h"

@interface SFTestViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentOutlet;

@end

@implementation SFTestViewController

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

- (void)viewDidAppear:(BOOL)animated
{
    if (self.segmentOutlet.selectedSegmentIndex == 0) {
        self.segmentOutlet.tintColor = [UIColor redColor];
        NSLog(@"One");
    } else if (self.segmentOutlet.selectedSegmentIndex == 1) {
        self.segmentOutlet.tintColor = [UIColor blueColor];
        
        NSLog(@"Two");

    } else if(self.segmentOutlet.selectedSegmentIndex == 2)
    {
        self.segmentOutlet.tintColor = [UIColor greenColor];
        NSLog(@"Three");

    }
    
}
- (IBAction)selectedIndex:(id)sender {
    if (self.segmentOutlet.selectedSegmentIndex == 0) {
        self.segmentOutlet.tintColor = [UIColor redColor];
        NSLog(@"One");
    } else if (self.segmentOutlet.selectedSegmentIndex == 1) {
        self.segmentOutlet.tintColor = [UIColor blueColor];
        
        NSLog(@"Two");
        
    } else if(self.segmentOutlet.selectedSegmentIndex == 2)
    {
        self.segmentOutlet.tintColor = [UIColor orangeColor];
        NSLog(@"Three");
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
