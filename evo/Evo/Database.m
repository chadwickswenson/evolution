//
//  Database.m
//  Evo
//
//  Created by Ashley Schneider on 1/17/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import "Database.h"
#import "Animal.h"
#import "Timeline.h"

@implementation Database

static Database *_database;
static NSArray *timelines;

+ (Database*)database {
    if (_database == nil) {
        _database = [[Database alloc] init];
    }
    return _database;
}

- (id)init {
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"evo"
                                                             ofType:@"sqlite"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (NSArray *)timelineInfo {
    if(timelines != nil) return timelines;
    NSMutableArray *tLineArray = [[NSMutableArray alloc] init];
    NSMutableArray *animArray = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT * FROM Animal ORDER BY rank ASC";
    sqlite3_stmt *statement;
    int result = sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil);
    if(result != SQLITE_OK) {
        NSLog(@"Prepare-error #%i: %s", result, sqlite3_errmsg(_database));
        return tLineArray;
    }
     
    while (sqlite3_step(statement) == SQLITE_ROW) {
        char *nameChars = (char *) sqlite3_column_text(statement, 0);
        int order = sqlite3_column_int(statement, 1);
        char *filenameChars = (char *) sqlite3_column_text(statement, 2);
        int uniqueId = sqlite3_column_int(statement, 3);
        int timelineID = sqlite3_column_int(statement, 4);
        char *yearChars = (char *)sqlite3_column_text(statement, 5);
        
        NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
        NSString *filename = [[NSString alloc] initWithUTF8String:filenameChars];
        NSString *year = [[NSString alloc] initWithUTF8String:yearChars];
        Animal *anim = [[Animal alloc] initWithId:uniqueId];
        [anim setName:name];
        [anim setOrder:order];
        [anim setFileName:filename];
        [anim setTLineID:timelineID];
        [anim setYear:year];
        [animArray addObject:anim];
    }
    sqlite3_finalize(statement);
    
    
    NSString *query1 = @"SELECT * FROM AnimalFact ORDER BY rank ASC";
   
    sqlite3_stmt *statement1;
    int result1 = sqlite3_prepare_v2(_database, [query1 UTF8String], -1, &statement1, nil);
    
    if(result1 != SQLITE_OK) {
        NSLog(@"Prepare-error #%i: %s", result1, sqlite3_errmsg(_database));
        return tLineArray;
    }
    
    while (sqlite3_step(statement1) == SQLITE_ROW) {
        char *textChars = (char *) sqlite3_column_text(statement1, 1);
        int* animalNum = sqlite3_column_int(statement1, 2);
        
        
        NSString *text = [[NSString alloc] initWithUTF8String:textChars];
        
        //[facts addObject:text];
        //factAni[z++] = animalNum;
       // NSLog(@"%ld",(long)[[animArray objectAtIndex:0] getUniqueID]);
        for (Animal *anim in animArray) {
           
               if([anim getUniqueID] == animalNum){
                    [anim addFact:text];
                }
            
        }

        
        
    }
    sqlite3_finalize(statement1);
    
       /*for(int i = 0; i < [animArray count];i++){
        
       
           NSLog(@"%@",factAni[j]);
             //if([factAni[j] isEqualToNumber:[NSNumber numberWithInt:[[animArray objectAtIndex:i] getID]]]){
                 //[[animArray objectAtIndex:i] addFact:[facts objectAtIndex:j]];
                // break;
           // }
             
        }
        
    }*/
    
    NSString *query2 = @"SELECT * FROM Timeline ORDER BY ID ASC";
    sqlite3_stmt *statement2;
    int result2 = sqlite3_prepare_v2(_database, [query2 UTF8String], -1, &statement2, nil);
    if(result2 != SQLITE_OK) {
        NSLog(@"Prepare-error #%i: %s", result2, sqlite3_errmsg(_database));
        return tLineArray;
    }
    
    while (sqlite3_step(statement2) == SQLITE_ROW) {
        int uniqueId = sqlite3_column_int(statement2, 0);
        char *nameChars = (char *) sqlite3_column_text(statement2, 1);
        char *descChars = (char *) sqlite3_column_text(statement2, 2);
        
        NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
        NSString *desc = [[NSString alloc] initWithUTF8String:descChars];
        
        Timeline *tLine = [[Timeline alloc] initWithID:uniqueId];
        [tLine setName:name];
        [tLine setDesc:desc];
        [tLineArray addObject:tLine];
    }
    sqlite3_finalize(statement2);
    
    for (Timeline *tLine in tLineArray) {
        NSMutableArray *animals = [[NSMutableArray alloc] init];
        for (Animal *anim in animArray) {
            if ([tLine getID] == [anim getTLineID]) {
                [animals addObject:anim];
            }
        }
        [tLine setAnimals:animals];
    }
    
    
    
    
    timelines = [[NSArray alloc] initWithArray:tLineArray];
    
    
    
    return timelines;
}

@end;
