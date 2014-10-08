//
//  MagicalCreature.m
//  MCMS
//
//  Created by Adam Cooper on 10/7/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name{
    self = [super self];
    if (self){
        self.name = name;
    }
    return self;
}

@end
