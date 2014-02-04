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


@property (strong, nonatomic) NSMutableArray *strongArray;

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
    [self.theaterController populateFilmData:@"85629"];
    _strongArray = [NSMutableArray arrayWithArray: self.theaterController.rottenTomatoesArray];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadTable:)
                                                 name:@"reload"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(detailedView:)
                                                 name:@"detail"
                                               object:nil];
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom)];
    //There is a direction property on UISwipeGestureRecognizer. You can set that to both right and left swipes
    recognizer.direction  =  UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft;
    [self.theaterTableView addGestureRecognizer:recognizer];
//    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
//    [tapBackground setNumberOfTapsRequired:1];
//    [self.view addGestureRecognizer:tapBackground];
    
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    
    if (self.segmentOutlet.selectedSegmentIndex == 0) {
        self.segmentOutlet.tintColor = [UIColor redColor];
    } else if (self.segmentOutlet.selectedSegmentIndex == 1) {
        self.segmentOutlet.tintColor = [UIColor blueColor];
    } else if(self.segmentOutlet.selectedSegmentIndex == 2)
    {
        self.segmentOutlet.tintColor = [UIColor greenColor];
    }
    
}
- (IBAction)selectedIndex:(id)sender {
    if (self.segmentOutlet.selectedSegmentIndex == 0) {
        
        [self.view endEditing:YES];
        self.segmentOutlet.tintColor = [UIColor redColor];
        self.theaterController.rottenTomatoesArray = _strongArray;
        NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
        self.theaterController.rottenTomatoesArray = [NSMutableArray arrayWithArray:[self.theaterController.rottenTomatoesArray sortedArrayUsingDescriptors:@[nameSorter]]];
        
       [self.theaterTableView reloadData];
        
    } else if (self.segmentOutlet.selectedSegmentIndex == 1) {
        [self.view endEditing:YES];
        self.segmentOutlet.tintColor = [UIColor blueColor];
        self.theaterController.rottenTomatoesArray = _strongArray;

        NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:NO];
        self.theaterController.rottenTomatoesArray = [NSMutableArray arrayWithArray:[self.theaterController.rottenTomatoesArray sortedArrayUsingDescriptors:@[nameSorter]]];
        
        [self.theaterTableView reloadData];
        
    } else if(self.segmentOutlet.selectedSegmentIndex == 2)
    {
        [self.view endEditing:YES];
        self.segmentOutlet.tintColor = [UIColor orangeColor];
        self.theaterController.rottenTomatoesArray = _strongArray;

        NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"ratingVariance" ascending:YES];
        self.theaterController.rottenTomatoesArray = [NSMutableArray arrayWithArray:[self.theaterController.rottenTomatoesArray sortedArrayUsingDescriptors:@[nameSorter]]];
        
       // [self.theaterTableView reloadData];
        
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

#pragma mark - Dynamically search text as user enters it

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
   // NSLog(@"%@", searchBar.text);
    searchBar.text = @"";
    [searchBar resignFirstResponder];

}


//Updates as user enters text
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSMutableArray *searchArray = [NSMutableArray new];
    self.theaterController.rottenTomatoesArray = _strongArray;
    
    NSLog(@"%@", searchText);
    
    for (FilmModel *model in self.theaterController.rottenTomatoesArray)
    {
        NSString *string = [model.title uppercaseString];
        if ([string hasPrefix:[searchText uppercaseString]])
        {
            [searchArray addObject:model];
        }
    }
    
    if (searchText.length == 0) {
        self.theaterController.rottenTomatoesArray = _strongArray;
    } else {
        self.theaterController.rottenTomatoesArray = searchArray;
    }
    
    [self.theaterTableView reloadData];
}

-(void) dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

- (void)reloadTable:(NSNotification *)note
{
    FilmModel *model = [note.userInfo objectForKey:@"film"];
    NSInteger modelRow = [self.theaterController.rottenTomatoesArray indexOfObject:model];
    NSIndexPath *row = [NSIndexPath indexPathForRow:modelRow inSection:0];
    
    [self.theaterTableView reloadRowsAtIndexPaths:@[row] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)detailedView:(NSNotification *)note
{
    FilmModel *model = [note.userInfo objectForKey:@"user"];
    
    //NSInteger modelRow = [self.theaterController.rottenTomatoesArray indexOfObject:model];
    
    NSLog(@"%@", [note userInfo] );
   // NSIndexPath *row = [NSIndexPath indexPathForRow:modelRow inSection:0];
    
  //  SFMovieDetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"detailMovie"];
  //  controller.movieTitle.text = @"hello";//[self.theaterController.rottenTomatoesArray[modelRow] title];
}

- (void)handleSwipeFrom
{
    NSLog(@"SWIPE");
}

@end