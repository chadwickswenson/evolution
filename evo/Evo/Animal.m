//
//  Animal.m
//  Evo
//
//  Created by Ashley Schneider on 1/21/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (Animal *)initWithId:(NSInteger)animID {
    
    ID = animID;
    facts = [[NSMutableArray alloc] init];
    return self;
}

- (void)setName:(NSString *)animName {
    
    name = animName;
}

- (void)setOrder:(NSInteger)animOrder {
    
    order = animOrder;
}

- (void)setFileName:(NSString *)animFile {
    
    filename = animFile;
}

- (void)setTLineID:(NSInteger)tLineID {
    
    timelineID = tLineID;
}

- (void)setYear:(NSString *)animYear {
    
    year = animYear;
}

- (void)addFact:(NSString*)f {
    
    [facts addObject:f];
    
}

- (NSString *)getName {
    
    return name;
}

- (NSInteger)getOrder {
    
    return order;
}

- (NSString *)getFileName {
    
    return filename;
}

- (NSInteger)getTLineID {
    
    return timelineID;
}

- (NSString *)getYear {
    
    return year;
}
- (NSMutableArray *)getFacts {
    
    return facts;
}
- (NSInteger *)getUniqueID {
    
    return ID;
}

@end
