//
//  MagicalCreatures.h
//  MCMS
//
//  Created by Adam Cooper on 10/7/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *favoriteMusic;
@property UIImage *creatureImage;
@property NSMutableArray *accessories;

-(instancetype)initWithName:(NSString *)name;

@end
