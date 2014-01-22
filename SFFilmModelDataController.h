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

@interface SFFilmModelDataController : NSObject <UITableViewDataSource>

@property (nonatomic) NSMutableArray *rottenMutableArray, *sortedMutableArray, *seenItArray;
@property (nonatomic) NSArray *sortedArray;

- (void)populateFilmData;

@end
