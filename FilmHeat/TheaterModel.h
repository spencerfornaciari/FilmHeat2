//
//  TheaterModel.h
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/31/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheaterModel : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *address;
@property (nonatomic) NSInteger goodFilms;
@property (nonatomic) NSInteger badFilms;
@property (nonatomic) NSInteger totalFilms;

@end
