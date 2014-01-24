//
//  SFSeenFilmTableViewController.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/20/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFInTheaterTableViewController.h"

@interface SFInTheaterTableViewController ()
{
    NSMutableArray *myArray;
}

@end

@implementation SFInTheaterTableViewController



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.theaterFilmsController = [SFFilmModelDataController new];
    
    self.tableView.dataSource = self.theaterFilmsController;
    
    [self.theaterFilmsController populateFilmData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - UIActionSheet

- (IBAction)sortNames:(id)sender {
    
    //Create the UIAction sheet and display it
    UIActionSheet *sortOptions = [[UIActionSheet alloc] initWithTitle:@"Sort Options"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil otherButtonTitles:@"Critic Rating", @"Audience Rating", nil];
    
    [sortOptions showInView:self.view];
}

// Responses to UIActionSheet selections
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
        {
                NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"filmCriticsRating" ascending:NO];
                self.theaterFilmsController.rottenMutableArray = [NSMutableArray arrayWithArray:[self.theaterFilmsController.rottenMutableArray sortedArrayUsingDescriptors:@[nameSorter]]];
            NSLog(@"Critics");
            
                    [self.tableView reloadData];
        }
            break;
            
        case 1:
        {
            NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"filmAudienceRating" ascending:NO];
            self.theaterFilmsController.rottenMutableArray = [NSMutableArray arrayWithArray:[self.theaterFilmsController.rottenMutableArray sortedArrayUsingDescriptors:@[nameSorter]]];
            NSLog(@"Audiences");
            
            [self.tableView reloadData];
        }
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row selected");
    [myArray addObject:self.theaterFilmsController.rottenMutableArray[indexPath.row]];
    NSLog(@"%@", [self.theaterFilmsController.rottenMutableArray[indexPath.row] filmTitle]);
    [self.theaterFilmsController.rottenMutableArray removeObjectAtIndex:indexPath.row];
    
    [self.tableView reloadData];
}

@end