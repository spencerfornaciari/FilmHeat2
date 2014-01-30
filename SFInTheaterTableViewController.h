//
//  SFSeenFilmTableViewController.h
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/20/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmModel.h"
#import "SFFilmModelDataController.h"

@interface SFInTheaterTableViewController : UITableViewController <UIActionSheetDelegate>

@property (nonatomic) SFFilmModelDataController *theaterFilmsController;

- (IBAction)sortNames:(id)sender;

@end
