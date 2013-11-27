//
//  Database.h
//  Evo
//
//  Created by Ashley Schneider on 1/17/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Database : NSObject {

    sqlite3 *_database;
}

+ (Database*)database;
- (NSArray *)timelineInfo;

@end
