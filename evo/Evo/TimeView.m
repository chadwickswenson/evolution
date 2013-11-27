//
//  TimeView.m
//  Evo
//
//  Created by Chad Swenson on 7/31/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import "TimeView.h"
#import "QuartzCore/QuartzCore.h"

@interface TimeView ()

@end

@implementation TimeView

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
     UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, 568, 300)];
    
    [self.backview addSubview:scrollview];
    
    
    
    self.timeImg.translatesAutoresizingMaskIntoConstraints = YES;
    [scrollview addSubview:self.timeImg];
    
    self.timeImg.frame = CGRectMake(0, -340, 568, 6000);
    
    scrollview.contentSize = CGSizeMake(568, 5320);
   
    self.doneButton.layer.zPosition = 5;
   
    
    CGPoint bottomOffset = CGPointMake(0, scrollview.contentSize.height - scrollview.bounds.size.height);
    [scrollview setContentOffset:bottomOffset animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneTouched:(id)sender {
    NSLog(@"HIIII");
}
@end
