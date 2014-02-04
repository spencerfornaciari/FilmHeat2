//
//  SFMovieDetailViewController.h
//  FilmHeat
//
//  Created by Spencer Fornaciari on 2/3/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFMovieDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *moviePoster;
@property (weak, nonatomic) IBOutlet UITextView *movieSynopsis;
@property (weak, nonatomic) IBOutlet UILabel *myRating;
@property (weak, nonatomic) IBOutlet UISlider *ratingSlider;

- (IBAction)ratingsSliderInput:(id)sender;

@end