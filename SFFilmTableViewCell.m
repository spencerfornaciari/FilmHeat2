//
//  SFFilmTableViewCell.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/22/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFFilmTableViewCell.h"

@implementation SFFilmTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFilm:(FilmModel *)film
{
    _film = film;
    
    self.filmTitle.text = film.title;
    //self.filmTitle.textColor = [UIColor whiteColor];
    
    self.filmCriticRating.text = [[NSNumber numberWithInt:film.criticsRating] stringValue];
    //self.filmCriticRating.textColor = [UIColor whiteColor];
    
    self.filmAudienceRating.text = [[NSNumber numberWithInt:film.audienceRating] stringValue];
    //self.filmAudienceRating.textColor = [UIColor whiteColor];
    
    self.ratingVariance.text = [[NSNumber numberWithInt:film.ratingVariance] stringValue];
    //self.ratingVariance.textColor = [UIColor whiteColor];
    
    NSURL *url = [NSURL URLWithString:film.thumbnailPoster];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    //self.backgroundColor = [UIColor grayColor];
    self.filmThumbnailPoster.image = image;
    self.filmThumbnailPoster.layer.cornerRadius = 32.f;
    self.filmThumbnailPoster.layer.masksToBounds = YES;
}

@end