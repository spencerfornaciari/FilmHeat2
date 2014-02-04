//
//  SFFilmModelDataController.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/22/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFFilmModelDataController.h"
#import "SFMovieDetailViewController.h"

#define ROTTEN_TOMATOES_API_KEY @"sxqdwkta4vvwcggqmm5ggja7"
#define TMS_API_KEY @"7f4sgppp533ecxvutkaqg243"

@implementation SFFilmModelDataController

- (void)populateFilmData:(NSString *)zipCode
{
    _seenItArray = [[NSMutableArray alloc] init];
    _downloadQueue = [NSOperationQueue new];

   // NSString *rottenString = [NSString stringWithFormat:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=%@", ROTTEN_TOMATOES_API_KEY];
    
    
    NSString *tmsString = [NSString stringWithFormat:@"http://data.tmsapi.com/v1/movies/showings?startDate=2014-02-04&zip=%@&imageSize=Sm&imageText=false&api_key=%@", zipCode, TMS_API_KEY];
    
    NSURL *tmsURL = [NSURL URLWithString:tmsString];
    
    NSData *tmsData = [NSData dataWithContentsOfURL:tmsURL];
    
    NSError *error;
    
    //NSDictionary *tmsDictionary = [NSJSONSerialization JSONObjectWithData:tmsData options:NSJSONReadingMutableContainers error:&error];
    
    NSArray *tmsArray = [NSJSONSerialization JSONObjectWithData:tmsData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&error];
    
    
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
    
    NSMutableArray *rottenInstance = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in tmsArray)
    {
        FilmModel *film = [FilmModel new];
        
        film.downloadQueue = self.downloadQueue;
        //film.isDownloading = NO;
        
        film.title = dictionary[@"title"];
        NSLog(@"%@", film.title);
        
        film.synopsis = dictionary[@"shortDescription"];
        
        //Set the film's MPAA rating
        film.mpaaRating = [dictionary valueForKeyPath:@"ratings.code"];
        
        //Grab the URL for the thumbnail of the film's poster
        NSString *poster = [dictionary valueForKeyPath:@"preferredImage.uri"];
        film.thumbnailPoster = [NSString stringWithFormat:@"http://developer.tmsimg.com/%@?api_key=%@", poster, TMS_API_KEY];
        //NSLog(@"%@", film.thumbnailPoster);
        
        film.showtimes = [dictionary valueForKey:@"showtimes"];
        film.genres = [dictionary valueForKey:@"genres"];
        
        film.runtime = [film runTimeConverter:[dictionary valueForKey:@"runTime"]];
//
        film.releaseDate = [film releaseDateConverter:[dictionary valueForKey:@"releaseDate"]];
    
//        NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
//        [dateFormatter2 setDateStyle:NSDateFormatterShortStyle];
//        NSLog(@"%@", [dateFormatter2 stringFromDate:film.releaseDate]);
        
       // NSString *string2 = [dictionary valueForKeyPath:@"showtimes.theatre.name"];
       // NSLog(@"%@", string2);
        
        [rottenInstance addObject:film];
       
    }
    
    
    _rottenTomatoesArray = [NSArray arrayWithArray:rottenInstance];
//    for (NSDictionary *dictionary in rottenArray)
//    {
//        //Create a film object
//        FilmModel *film = [FilmModel new];
//        
//        //Set the film title
//        film.title = [dictionary objectForKey:@"title"];
//        
//        //Set the critics rating of the film according to Rotten Tomatoes
//        film.criticsRating = [[dictionary valueForKeyPath:@"ratings.critics_score"] integerValue];
//        
//        //Set the audience rating of the film according to Rotten Tomatoes
//        film.audienceRating = [[dictionary valueForKeyPath:@"ratings.audience_score"] integerValue];
//        
//        //Calculating the difference between critic and audience rating
//        film.ratingVariance = abs(film.criticsRating - film.audienceRating);
//        
//        //Grab the URL for the thumbnail of the film's poster
//        film.thumbnailPoster = [dictionary valueForKeyPath:@"posters.thumbnail"];
//        
//        //Set the film runtime
//        film.runtime = [dictionary valueForKeyPath:@"runtime"];
//        
//        //Set the film's MPAA rating
//        film.mpaaRating = [dictionary valueForKeyPath:@"mpaa_rating"];
//        
//        //Set the film's synopsis
//        film.synopsis = [dictionary valueForKeyPath:@"synopsis"];
//        
//        //Set the path to the film's IMDb page
//        film.imdb = [NSString stringWithFormat:@"http://www.imdb.com/title/tt%@/",[dictionary valueForKeyPath:@"alternate_ids.imdb"]];
//        
//        [_rottenTomatoesArray addObject:film];
//    }
    
    //Sort the film objects by the critics rating
//    NSSortDescriptor *nameSorter = [NSSortDescriptor sortDescriptorWithKey:@"criticsRating" ascending:NO];
//    _rottenTomatoesArray = [NSMutableArray arrayWithArray:[_rottenTomatoesArray sortedArrayUsingDescriptors:@[nameSorter]]];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _rottenTomatoesArray.count;
    //NSLog(@"%lu", (unsigned long)_rottenTomatoesArray.count);
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
    [[NSNotificationCenter defaultCenter] postNotificationName:@"detail" object:nil userInfo:@{@"film": self}];
    
    
    //[self ]
    
    
    
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        NSDictionary *repoDict = _searchResults[indexPath.row];
//        self.detailViewController.detailItem = repoDict;
//    }
    
  //  [myArray addObject:self.rottenTomatoesArray[indexPath.row]];
  //  NSLog(@"%@", [self.rottenTomatoesArray[indexPath.row] title]);
  //  [self.rottenTomatoesArray removeObjectAtIndex:indexPath.row];
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"reload" object:nil userInfo:nil];
     //[[NSNotificationCenter defaultCenter] postNotificationName:@"DownloadedImage" object:nil userInfo:@{@"user": self}];
    //[self.rottenTomatoesArray ]
    //
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Detemine if it's in editing mode
//    if (self.editing)
//    {
//        return UITableViewCellEditingStyleDelete;
//    }
    
    return UITableViewCellEditingStyleNone;
}

@end