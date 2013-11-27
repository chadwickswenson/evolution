//
//  PageOneViewController.m
//  Evo
//
//  Created by Chad Swenson on 8/5/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import "PageOneViewController.h"

@interface PageOneViewController ()

@end

@implementation PageOneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    cur = 0;
    
    CGRect f = self.stars.frame;
    
   // f.origin.x = -1000;
   // f.origin.y = 2000;
    
    [UIView animateWithDuration:20.0f
                     animations:^{
                        // [self.stars setFrame:f];
                         self.stars.transform = CGAffineTransformMakeRotation(M_PI);
                     }
     ];
    [UIView animateWithDuration:5.0f
                     animations:^{
                        [self.text1 setAlpha:1.0f];
                         
                     }
     ];
    
    UILabel *label =  [[UILabel alloc] initWithFrame: CGRectMake(600, 20, 100, 100)];
    label.text = @"tap"; //etc...
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [label setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25.0f]];
    [self.dHolder addSubview:label];
   
    
    [UIView animateWithDuration:4.0
                          delay:2.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         CGRect dFrame = label.frame;
                         dFrame.origin.y = 0;
                         dFrame.origin.x = 20;
                         label.frame = dFrame;
                        
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
    
    [UIView animateWithDuration:8.0f
                     animations:^{
                         
                         //[self.direction setFrame:theFrame];
                         
                     }
     ];
}
-(void)viewDidAppear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionPressed:(id)sender {
    
    if(cur == 0){
        [self.animalImg setImage:[UIImage imageNamed:@"parrot.png"]];
    }
    if(cur == 1){
        [self.animalImg setImage:[UIImage imageNamed:@"tiger.png"]];
    }
    if(cur == 2){
        [self.animalImg setImage:[UIImage imageNamed:@"dolphin.png"]];
    }
    if(cur == 3){
        [self.animalImg setImage:[UIImage imageNamed:@"coelurosauria.png"]];
    }
    if(cur == 4){
        [self.animalImg setImage:[UIImage imageNamed:@"whale.png"]];
    }
    if(cur == 5){
        [self.animalImg setImage:[UIImage imageNamed:@"tiktaalik.png"]];
    }
    
    cur++;
    if(cur > 3){
    [UIView animateWithDuration:3.0f
                     animations:^{
                         [self.text2 setAlpha:1.0f];
                         [self.next setAlpha:1.0f];
                     }
     ];
    }
    
    
}

- (IBAction)nextPage:(id)sender {
    [self.animalImg setAlpha:0.0f];
    [UIView animateWithDuration:2.5
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         CGRect dFrame = self.bg.frame;
                         dFrame.size.width = dFrame.size.width*3;
                         dFrame.size.height = dFrame.size.height*3;
                         dFrame.origin.x -= dFrame.size.width/3;
                         dFrame.origin.y -= dFrame.size.height/3;
                         self.bg.frame = dFrame;
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         [self.nextTrigger sendActionsForControlEvents:UIControlEventTouchUpInside];
                     }];

}
@end
