//
//  FilmModel.h
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/20/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilmModel : NSObject

@property (strong, nonatomic) NSString *filmTitle;
@property (strong, nonatomic) NSNumber *filmAudienceRating;
@property (strong, nonatomic) NSNumber *filmCriticsRating;
@property (strong, nonatomic) NSString *filmThumbnailPoster;
@property (strong, nonatomic) NSString *filmIMDb;
@property (strong, nonatomic) NSNumber *filmRuntime;
@property (strong, nonatomic) NSString *filmSynopsis;
@property (strong, nonatomic) NSString *filmMPAARating;
@property (strong, nonatomic) NSNumber *filmReleaseYear;


@end
