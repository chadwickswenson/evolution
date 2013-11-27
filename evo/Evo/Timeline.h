//
//  Timeline.h
//  Evo
//
//  Created by Ashley Schneider on 1/21/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timeline : NSObject {
    
    @private NSString *name;
    @private NSString *desc;
    @private NSInteger ID;
    @private NSArray *animals;
}

- (Timeline *)initWithID:(NSInteger)tLineID;
- (void)setName:(NSString *)tLineName;
- (void)setAnimals:(NSArray *)tLineAnimals;
- (NSInteger)getID;
- (NSString *)getName;
- (NSArray *)getAnimals;
- (NSString *)getDesc;
- (void)setDesc:(NSString *)tLineDesc;

@end
