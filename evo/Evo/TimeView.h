//
//  TimeView.h
//  Evo
//
//  Created by Chad Swenson on 7/31/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeView : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *imgScrollView;
@property (strong, nonatomic) IBOutlet UIView *subView1;
@property (strong, nonatomic) IBOutlet UIImageView *timeImg;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) IBOutlet UIView *backview;
- (IBAction)doneTouched:(id)sender;

@end
