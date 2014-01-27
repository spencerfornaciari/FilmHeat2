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
    self.filmCriticRating.text = [[NSNumber numberWithInt:film.criticsRating] stringValue]; //[film.criticsRating stringValue];
    self.filmAudienceRating.text = [[NSNumber numberWithInt:film.audienceRating] stringValue];
    
    NSURL *url = [NSURL URLWithString:film.thumbnailPoster];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    self.filmThumbnailPoster.image = image;
}

@end