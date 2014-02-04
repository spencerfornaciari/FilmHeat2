//
//  TheaterModel.h
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/31/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowtimeModel : NSObject

@property (nonatomic) NSString *theaterName;
@property (nonatomic) NSDate *screeningDate;
@property (nonatomic) NSURL *ticketURL;

-(NSDate *)showtimeDateConverter:(NSString *)showtimeDateString;

@end
