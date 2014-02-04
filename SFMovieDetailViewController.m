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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.movieSynopsis.text = _film.synopsis;
    self.moviePoster.image = _film.posterImage;
    self.movieYear.text = _film.releaseYear.stringValue;
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

-(void)setFilm:(FilmModel *)film
{
    _film = film;
    
//    @property (weak, nonatomic) IBOutlet UIImageView *moviePoster;
//    @property (weak, nonatomic) IBOutlet UITextView *movieSynopsis;
//    @property (weak, nonatomic) IBOutlet UILabel *myRating;
//    @property (weak, nonatomic) IBOutlet UISlider *ratingSlider;
//    @property (weak, nonatomic) IBOutlet UILabel *movieYear;
    
}

@end
