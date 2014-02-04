//
//  FilmModel.h
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/20/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilmModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (nonatomic) NSInteger audienceRating;
@property (nonatomic) NSInteger criticsRating;
@property (nonatomic) NSInteger ratingVariance;
@property (strong, nonatomic) NSString *thumbnailPoster;
@property (strong, nonatomic) UIImage *posterImage;
@property (strong, nonatomic) NSString *imdb;
@property (strong, nonatomic) NSNumber *runtime;
@property (strong, nonatomic) NSString *synopsis;
@property (strong, nonatomic) NSString *mpaaRating;
@property (strong, nonatomic) NSNumber *releaseYear;
@property (nonatomic) NSArray *genres;

@property (nonatomic) BOOL isDownloading;
@property (strong, nonatomic) NSArray *showtimes;
@property (nonatomic, weak) NSOperationQueue *downloadQueue;

-(void)downloadPoster;

@end
