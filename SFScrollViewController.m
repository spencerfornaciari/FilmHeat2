//
//  SFScrollViewController.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/29/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFScrollViewController.h"
#import "SFInTheaterTableViewController.h"

@interface SFScrollViewController ()
{
    NSMutableArray *controllers;
}

@end

@implementation SFScrollViewController

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
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [self.view addSubview:scrollView];
    
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(320*2, 460); //this must be the appropriate size!
    
    //required to keep your view controllers around
    controllers = [[NSMutableArray alloc] initWithCapacity:0];
    
    //just adding two controllers
    SFInTheaterTableViewController *one = [[SFInTheaterTableViewController alloc] initWithPosition:0 text:@"one"];
    
    [scrollView addSubview:one.view];
    [controllers addObject:one];
    
    SFInTheaterTableViewController *two = [[SFInTheaterTableViewController alloc] initWithPosition:1 text:@"two"];
    [scrollView addSubview:two.view];
    [controllers addObject:two];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
