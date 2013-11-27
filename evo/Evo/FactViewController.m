//
//  FactViewController.m
//  Evo
//
//  Created by Chad Swenson on 8/6/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import "FactViewController.h"

@interface FactViewController ()

@end

@implementation FactViewController

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
    [self setFact];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) setFact{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"DDD"];
    NSInteger dayInYear = [[dateFormat stringFromDate:today] integerValue];
    NSLog(@"today is %d. day in year", dayInYear);
    
    NSString* fact = @"Sharks have no bones! Good luck finding fossils...";
    [self.bg setImage:[UIImage imageNamed:@"fact.jpg"]];
    
    if(dayInYear == 0){
        fact = @"Sharks have no bones! Good luck finding fossils...";
        [self.bg setImage:[UIImage imageNamed:@"story1.png"]];
    }
    
    self.text.text = fact;
    
}
@end
