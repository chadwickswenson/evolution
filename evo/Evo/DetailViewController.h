//
//  DetailViewController.h
//  Evo
//
//  Created by Ashley Schneider on 1/8/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Timeline.h"
#import "Animal.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate> {
    
    @private Timeline *timeline;
    @private Animal *animal;
    @private int index;
    @private int backIndex;
    @private bool play;
    @private NSTimer *timer;
    @private int factNum;
}

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timePeriod;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@property (weak, nonatomic) IBOutlet UILabel *endDate;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIView *greyBackground;
@property (weak, nonatomic) IBOutlet UILabel *factView;

- (IBAction)panned:(UIPanGestureRecognizer *)gesture;
- (IBAction)right:(id)sender;
- (IBAction)left:(id)sender;
- (IBAction)goHome:(id)sender;
- (IBAction)play:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (void)setTimeline:(Timeline *)newDetailItem;
- (void)changeAnimal:(int) anim;
- (IBAction)nextFact:(id)sender;

@end
