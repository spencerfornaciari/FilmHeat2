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
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //scrollView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:scrollView];
    
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(320*3, self.view.frame.size.height); //this must be the appropriate size!
    
    //required to keep your view controllers around
    controllers = [[NSMutableArray alloc] initWithCapacity:0];
    
    //just adding two controllers
    UIViewController *one = [self.storyboard instantiateViewControllerWithIdentifier:@"filmMap"];
    one.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [scrollView addSubview:one.view];
    [controllers addObject:one];
    
//    UIViewController *two = [[UIViewController alloc] init];
//    two.view.backgroundColor = [UIColor blueColor];
//    two.view.frame = CGRectMake(320, 0, self.view.frame.size.width, self.view.frame.size.height);
//    [scrollView addSubview:two.view];
//   [controllers addObject:two];
    
    UIViewController *two = [self.storyboard instantiateViewControllerWithIdentifier:@"inTheaters"];
    two.view.frame = CGRectMake(320, 0, self.view.frame.size.width, self.view.frame.size.height);
    [scrollView addSubview:two.view];
   [controllers addObject:two];
    

//    [self addChildViewController:two];
//    two.view.frame = CGRectMake(320, 0, self.view.frame.size.width, self.view.frame.size.height);
//    [scrollView addSubview:two.view];
//    [two didMoveToParentViewController:self];
    
    [controllers addObject:two];
 
    
    
    UIViewController *three = [self.storyboard instantiateViewControllerWithIdentifier:@"filmHistory"];
    three.view.backgroundColor = [UIColor greenColor];
    three.view.frame = CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, self.view.frame.size.height);
    [scrollView addSubview:three.view];
    [controllers addObject:three];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
