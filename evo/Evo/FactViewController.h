//
//  FactViewController.h
//  Evo
//
//  Created by Chad Swenson on 8/6/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactViewController : UIViewController
- (IBAction)backPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *bg;
@property (strong, nonatomic) IBOutlet UILabel *text;

@end
