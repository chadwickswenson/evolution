//
//  Timeline.m
//  Evo
//
//  Created by Ashley Schneider on 1/21/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import "Timeline.h"

@implementation Timeline 
    
- (Timeline *)initWithID:(NSInteger)timeID {
    
    ID = timeID;
    return self;
}

- (void)setName:(NSString *)tLineName {
    
    name = tLineName;
}
- (void)setDesc:(NSString *)tLineDesc {
    
    desc = tLineDesc;
}
- (void)setAnimals:(NSArray *)tLineAnimals {
    
    animals = tLineAnimals;
}

- (NSString *)getName {
    
    return name;
}
- (NSString *)getDesc {
    
    return desc;
}
- (NSArray *)getAnimals {
    
    return animals;
}

- (NSInteger)getID {
    
    return ID;
}

@end
