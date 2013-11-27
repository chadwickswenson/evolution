//
//  PageOneViewController.h
//  Evo
//
//  Created by Chad Swenson on 8/5/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageOneViewController : UIViewController{
    @private int cur;
}

@property (strong, nonatomic) IBOutlet UIImageView *stars;
@property (strong, nonatomic) IBOutlet UIImageView *animalImg;
@property (strong, nonatomic) IBOutlet UILabel *text2;
@property (strong, nonatomic) IBOutlet UILabel *text1;
@property (strong, nonatomic) IBOutlet UILabel *direction;
@property (strong, nonatomic) IBOutlet UIButton *next;
@property (strong, nonatomic) IBOutlet UIButton *action;
@property (strong, nonatomic) IBOutlet UIView *dHolder;
@property (strong, nonatomic) IBOutlet UIImageView *bg;
@property (strong, nonatomic) IBOutlet UIButton *nextTrigger;

- (IBAction)actionPressed:(id)sender;
- (IBAction)nextPage:(id)sender;

@end
