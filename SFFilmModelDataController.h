//
//  SFFilmModelDataController.h
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/22/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FilmModel.h"
#import "ShowtimeModel.h"
#import "SFFilmTableViewCell.h"
#import "SFMovieDetailViewController.h"

@protocol SFFilmModelDataControllerDelegate <NSObject>

@required
-(void)selectedFilm:(FilmModel *)film;

@optional
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

@end

@interface SFFilmModelDataController : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, unsafe_unretained) id<SFFilmModelDataControllerDelegate>delegate;

@property (nonatomic) NSMutableArray *sortedRottenTomatoesArray;
@property (nonatomic) NSArray *rottenTomatoesArray;
@property (nonatomic, weak) NSArray *seenItArray, *wantedArray;
@property (nonatomic) NSArray *sortedArray;
@property (nonatomic, strong) NSOperationQueue *downloadQueue;
@property (nonatomic) SFMovieDetailViewController *detailController;
@property (nonatomic, readwrite) NSInteger selectedSegment;
@property (nonatomic, weak) UITableView *tableView;

- (void)populateFilmData:(NSString *)zipCode;

@end