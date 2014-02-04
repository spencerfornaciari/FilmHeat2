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

@end