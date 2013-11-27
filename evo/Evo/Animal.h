//
//  Animal.h
//  Evo
//
//  Created by Ashley Schneider on 1/21/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject {
    
    @private NSString *name;
    @private NSInteger ID;
    @private NSInteger order;
    @private NSString *filename;
    @private NSInteger timelineID;
    @private NSString *year;
    @private NSMutableArray *facts;
    
}

- (Animal *)initWithId:(NSInteger)animID;
- (void)setName:(NSString *)animName;
- (void)setOrder:(NSInteger)animOrder;
- (void)setFileName:(NSString *)animFile;
- (void)setTLineID:(NSInteger)tLineID;
- (void)setYear:(NSString *)animYear;
- (void)addFact:(NSString *)f;

- (NSString *)getName;
- (NSInteger)getOrder;
- (NSString *)getFileName;
- (NSInteger)getTLineID;
- (NSString *)getYear;
- (NSMutableArray *)getFacts;
- (NSInteger *)getUniqueID;
@end
