//
//  MasterViewController.h
//  Evo
//
//  Created by Ashley Schneider on 1/8/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomFontSegoeLight.h"

@class DetailViewController;

@interface MasterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
    @private NSArray *timelines;
    @private int cur;
}

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutletCollection(UICollectionView) NSArray *animalCollection;
@property (strong, nonatomic) IBOutlet UICollectionView *test;
@property (weak, nonatomic) IBOutlet UIImageView *bg;

- (IBAction)cellButtonPressed:(id)sender forEvent:(UIEvent *)event;

@end
