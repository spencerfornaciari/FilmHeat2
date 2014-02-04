//
//  FilmModel.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/20/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "FilmModel.h"

@implementation FilmModel

-(id)init
{
    self = [super init];
    _isDownloading = FALSE;
    _criticsRating = 10;
    _audienceRating = 90;
    _ratingVariance = 80;
    
    return self;
}

-(void)downloadPoster
{
    _isDownloading = TRUE;
    
    [_downloadQueue addOperationWithBlock:^{
        NSURL *posterURL = [NSURL URLWithString:self.thumbnailPoster];
        NSData *posterData = [NSData dataWithContentsOfURL:posterURL];
        self.posterImage = [UIImage imageWithData:posterData];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //_isDownloading = FALSE;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reload" object:nil userInfo:@{@"film": self}];
        }];
    }];
    
}

-(NSDate *)releaseDateConverter:(NSString *)releaseDateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *formattedDateString = releaseDateString;
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:formattedDateString];
    
    return dateFromString;
}

-(NSNumber *)runTimeConverter:(NSString *)runTimeString
{
    NSArray *runTimeRawCharacters = [runTimeString componentsSeparatedByCharactersInSet:
                        [NSCharacterSet characterSetWithCharactersInString:@"THM"]];
    NSMutableArray *runTimeParsedCharacters = [NSMutableArray arrayWithArray:runTimeRawCharacters];
    [runTimeParsedCharacters removeLastObject];

    int filmRuntime = 0;

    for (int i = 1; i < runTimeParsedCharacters.count; i++)
    {
        if (![runTimeParsedCharacters[i] isEqualToString:@""]) {
            if (i == 1) {
                filmRuntime = [runTimeParsedCharacters[i] integerValue] * 60;
            } else {
                filmRuntime = filmRuntime + [runTimeParsedCharacters[i] integerValue];
            }
        }
    }

    return [NSNumber numberWithInteger:filmRuntime];
}

//-(NSArray *)setShowTimes:(NSArray *)tmsShowtimeArray;
//{
//    NSMutableArray *showtimesMutable = [NSMutableArray new];
//    
//    for (NSDictionary *dictionary in tmsShowtimeArray)
//    {
//        ShowtimeModel *model = [ShowtimeModel new];
//        model.theaterName = [dictionary valueForKeyPath:@"showtimes.theatre.name"];
//        model.screeningDate = [dictionary valueForKeyPath:@"showtimes.theatre.dateTime"];
//        
//    }
//    
//    return nil;
//}

@end