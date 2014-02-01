//
//  SFFilmModelDataController.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/22/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFFilmModelDataController.h"

#define ROTTEN_TOMATOES_API @"sxqdwkta4vvwcggqmm5ggja7"

@implementation SFFilmModelDataController
{
    NSMutableArray *myArray;
}

- (void)populateFilmData
{
    _seenItArray = [[NSMutableArray alloc] init];

    NSString *rottenString = [NSString stringWithFormat:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=%@", ROTTEN_TOMATOES_API];
    
    NSURL *rottenURL = [[NSURL alloc] initWithString:rottenString];
    
    NSData *rottenData = [NSData dataWithContentsOfURL:rottenURL];
    
    
    NSError* error;
    NSDictionary *rottenDictionary = [NSJSONSerialization JSONObjectWithData:rottenData
                                                                     options:kNilOptions
                                                                       error:&error];
    
    NSArray *rottenArray = [rottenDictionary objectForKey:@"movies"];
    
    
    ///Find theaters: http://data.tmsapi.com/v1/theatres?zip=98121&api_key=7f4sgppp533ecxvutkaqg243
    //Theater showtimes: http://data.tmsapi.com/v1/theatres/8749/showings?startDate=2013-11-26&api_key=7f4sgppp533ecxvutkaqg243
    
    
    
    //    NSString *tmsString = @"http://data.tmsapi.com/v1/movies/showings?startDate=2014-02-01&zip=98121&api_key=7f4sgppp533ecxvutkaqg243";
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
    
    _rottenTomatoesArray = [[NSMutableArray alloc] initWithCapacity:rottenArray.count];
    
    for (NSDictionary *dictionary in rottenArray)
    {
        //Create a film object
        FilmModel *film = [FilmModel new];
        
        //Set the film title
        film.title = [dictionary objectForKey:@"title"];
        
        //Set the critics rating of the film according to Rotten Tomatoes
        film.criticsRating = [[dictionary valueForKeyPath:@"ratings.critics_score"] integerValue];
        
        //Set the audience rating of the film according to Rotten Tomatoes
        film.audienceRating = [[dictionary valueForKeyPath:@"ratings.audience_score"] integerValue];
        
        //Calculating the difference between critic and audience rating
        film.ratingVariance = abs(film.criticsRating - film.audienceRating);
        
        //Grab the URL for the thumbnail of the film's poster
        film.thumbnailPoster = [dictionary valueForKeyPath:@"posters.thumbnail"];
        
        //Set the film runtime
        film.runtime = [dictionary valueForKeyPath:@"runtime"];
        
        //Set the film's MPAA rating
        film.mpaaRating = [dictionary valueForKeyPath:@"mpaa_rating"];
        
        //Set the film's synopsis
        film.synopsis = [dictionary valueForKeyPath:@"synopsis"];
        
        //Set the path to the film's IMDb page
        film.imdb = [NSString stringWithFormat:@"http://www.imdb.com/title/tt%@/",[dictionary valueForKeyPath:@"alternate_ids.imdb"]];
        
        [_rottenTomatoesArray addObject:film];
    }
    
    //Sort the film objects by the critics rating
    NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"criticsRating" ascending:NO];
    _rottenTomatoesArray = [NSMutableArray arrayWithArray:[_rottenTomatoesArray sortedArrayUsingDescriptors:@[nameSorter]]];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _rottenTomatoesArray.count;
    NSLog(@"%lu", (unsigned long)_rottenTomatoesArray.count);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SFFilmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    [cell setFilm:_rottenTomatoesArray[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row selected");
    [myArray addObject:self.rottenTomatoesArray[indexPath.row]];
    NSLog(@"%@", [self.rottenTomatoesArray[indexPath.row] title]);
    [self.rottenTomatoesArray removeObjectAtIndex:indexPath.row];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reload" object:nil userInfo:nil];
     //[[NSNotificationCenter defaultCenter] postNotificationName:@"DownloadedImage" object:nil userInfo:@{@"user": self}];
    //[self.rottenTomatoesArray ]
    //
}

@end