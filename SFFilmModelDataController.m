//
//  SFFilmModelDataController.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/22/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFFilmModelDataController.h"

@implementation SFFilmModelDataController

- (void)populateFilmData
{
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //self.navigationItem.rightBarButtonItem = addButton;
    
    _seenItArray = [[NSMutableArray alloc] init];
    
    NSString *rottenString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=sxqdwkta4vvwcggqmm5ggja7";
    
    NSURL *rottenURL = [[NSURL alloc] initWithString:rottenString];
    
    NSData *rottenData = [NSData dataWithContentsOfURL:rottenURL];
    
    
    NSError* error;
    NSDictionary *rottenDictionary = [NSJSONSerialization JSONObjectWithData:rottenData
                                                                     options:kNilOptions
                                                                       error:&error];
    
    NSArray *rottenArray = [rottenDictionary objectForKey:@"movies"];
    
    
    ///Find theaters: http://data.tmsapi.com/v1/theatres?zip=98121&api_key=7f4sgppp533ecxvutkaqg243
    //Theater showtimes: http://data.tmsapi.com/v1/theatres/8749/showings?startDate=2013-11-26&api_key=7f4sgppp533ecxvutkaqg243
    
    
    
    //    NSString *tmsString = @"http://data.tmsapi.com/v1/movies/showings?startDate=2013-11-26&zip=98121&api_key=7f4sgppp533ecxvutkaqg243";
    //    NSURL *tmsURL = [NSURL URLWithString:tmsString];
    //    NSData *tmsData = [NSData dataWithContentsOfURL:tmsURL];
    //
    //    NSArray *tmsArray = [NSJSONSerialization JSONObjectWithData:tmsData
    //                                                                  options:kNilOptions
    //                                                                    error:&error];
    //
    //
    //    NSLog(@"%@", [tmsArray[0] objectForKey:@"title"]);
    //    NSLog(@"%@", [tmsArray[0] objectForKey:@"showtimes"][0]);
    //    NSLog(@"%@", [NSDate date]);
    //NSString *TMSSTRING = [[tmsArray[0] objectForKey:@"showtimes"][0] objectForKey:@"ticketURI"];
    //NSURL *testURL = [[tmsArray[0] objectForKey:@"showtimes"][0] objectForKey:@"ticketURI"]; // <-direct input works
    
    //NSString *testDate = [[tmsArray[0] objectForKey:@"showtimes"][0] objectForKey:@"dateTime"]; // <-direct input does not work correctly
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"hh:mm yyyy-MM-dd"];
    
    _rottenMutableArray = [[NSMutableArray alloc] initWithCapacity:rottenArray.count];
    
    for (NSDictionary *dictionary in rottenArray)
    {
        //Create a film object
        FilmModel *film = [FilmModel new];
        
        //Set the film title
        film.filmTitle = [dictionary objectForKey:@"title"];
        NSLog(@"%@", film.filmTitle);
        
        //Set the critics rating of the film according to Rotten Tomatoes
        NSLog(@" %@",[dictionary valueForKeyPath:@"ratings.critics_score"] );
        
        film.filmCriticsRating = [dictionary valueForKeyPath:@"ratings.critics_score"];
        
        //Set the audience rating of the film according to Rotten Tomatoes
        film.filmAudienceRating = [dictionary valueForKeyPath:@"ratings.audience_score"];
        NSLog(@"%@", film.filmAudienceRating);
        
        [_rottenMutableArray addObject:film];
    }
    
    //Sort the film objects by the critics rating
    NSSortDescriptor *rottenDescriptor = [[NSSortDescriptor alloc] initWithKey:@"filmCriticsRating" ascending:NO];
    NSArray *sortDescriptors = @[rottenDescriptor];
    _sortedArray = [_rottenMutableArray sortedArrayUsingDescriptors:sortDescriptors];
    _sortedMutableArray = [NSMutableArray arrayWithArray:_sortedArray];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _sortedMutableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SFFilmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    [cell setFilm:_sortedMutableArray[indexPath.row]];
    //cell.textLabel.text = [_sortedMutableArray[indexPath.row] filmTitle];
    
    return cell;
}


@end
