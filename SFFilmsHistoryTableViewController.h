//
//  SFFilmsHistoryTableViewController.h
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/26/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFFilmsHistoryTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
