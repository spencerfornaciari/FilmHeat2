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
@property (weak, nonatomic) IBOutlet UITableView *theaterTableView;
@property (strong, nonatomic) SFFilmModelDataController *theaterController;
@property (weak, nonatomic) IBOutlet UISearchBar *theaterSearchBar;

- (IBAction)buttonAction:(id)sender;

@end

@implementation SFTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.theaterController = [SFFilmModelDataController new];
    
    self.theaterSearchBar.delegate =self;
    
    self.theaterTableView.delegate = self.theaterController;
    self.theaterTableView.dataSource = self.theaterController;
    [self.theaterController populateFilmData];
    
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
        
        NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"criticsRating" ascending:NO];
        self.theaterController.rottenTomatoesArray = [NSMutableArray arrayWithArray:[self.theaterController.rottenTomatoesArray sortedArrayUsingDescriptors:@[nameSorter]]];
        
        [self.theaterTableView reloadData];
        
    } else if (self.segmentOutlet.selectedSegmentIndex == 1) {
        self.segmentOutlet.tintColor = [UIColor blueColor];
        
        NSLog(@"Two");
        
        NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"audienceRating" ascending:NO];
        self.theaterController.rottenTomatoesArray = [NSMutableArray arrayWithArray:[self.theaterController.rottenTomatoesArray sortedArrayUsingDescriptors:@[nameSorter]]];
        
        [self.theaterTableView reloadData];
        
    } else if(self.segmentOutlet.selectedSegmentIndex == 2)
    {
        self.segmentOutlet.tintColor = [UIColor orangeColor];
        NSLog(@"Three");
        
        NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"ratingVariance" ascending:YES];
        self.theaterController.rottenTomatoesArray = [NSMutableArray arrayWithArray:[self.theaterController.rottenTomatoesArray sortedArrayUsingDescriptors:@[nameSorter]]];
        
        [self.theaterTableView reloadData];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender {
    NSLog(@"Bar button");
    
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"Test Sheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Test 1", @"Test 2", nil];
    [action showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
        {

        }
            break;
            
        case 1:
        {

        }
            break;

    }
}

//Uses text when
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //NSMutableArray *array = [NSMutableArray new];
//    NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:searchBar.text ascending:NO];
//    
//    self.theaterController.rottenTomatoesArray = [NSMutableArray arrayWithArray:[self.theaterController.rottenTomatoesArray sortedArrayUsingDescriptors:@[nameSorter]]];
//    
//    [self.theaterTableView reloadData];
    NSLog(@"%@", searchBar.text);
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"%@", searchBar.text);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%@", searchBar.text);
    [searchBar resignFirstResponder];

}


//Updates as user enters text
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"%@", searchText);
//    NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:searchText ascending:NO];
//    //
//        self.theaterController.rottenTomatoesArray = [NSMutableArray arrayWithArray:[self.theaterController.rottenTomatoesArray sortedArrayUsingDescriptors:@[nameSorter]]];

}

@end
