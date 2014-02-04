//
//  SFFilmModelDataController.h
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/22/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FilmModel.h"
#import "SFFilmTableViewCell.h"
#import "SFMovieDetailViewController.h"

@interface SFFilmModelDataController : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSMutableArray *sortedRottenTomatoesArray, *seenItArray;
@property (nonatomic) NSArray *rottenTomatoesArray;
@property (nonatomic) NSArray *sortedArray;
@property (nonatomic, strong) NSOperationQueue *downloadQueue;
@property (nonatomic) SFMovieDetailViewController *detailController;

- (void)populateFilmData:(NSString *)zipCode;

@end