//
//  DetailViewController.m
//  Evo
//
//  Created by Ashley Schneider on 1/8/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import "DetailViewController.h"
#import "DejalActivityView.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

// return to list view
- (IBAction)goHome:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

// skip to one animal to the right
- (IBAction)swipeLefty:(id)sender {
}



- (IBAction)panGestured:(id)sender {
    NSLog(@"test");
}
- (IBAction)panned:(UIPanGestureRecognizer *)gesture
{
    float va = 0.015;
    float sliderSpeed = 0.00026;
     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
         va = 0.02;
         sliderSpeed = 0.0002;
     }
        CGPoint vel = [gesture velocityInView:self.view];
        [self moveSliderAmount:(vel.x*sliderSpeed)];
            if (vel.x > 0)
            {
                // user dragged towards the right
                if( !([[UIScreen mainScreen] bounds].size.height <= self.greyBackground.frame.size.width)){
                    [self.greyBackground setFrame:CGRectMake(0,0,self.greyBackground.frame.size.width+vel.x*va, self.greyBackground.frame.size.height )];
                }
            }
            else
            {
            // user dragged towards the left
                if( !(0 >= self.greyBackground.frame.size.width)){
                            [self.greyBackground setFrame:CGRectMake(0,0,self.greyBackground.frame.size.width+vel.x*va, self.greyBackground.frame.size.height )];
                }
                
            }
        
    
}
-(BOOL)panToEvolve:(float)amount{
    [self.slider setValue:0];
    index = 0;
    backIndex = 1;
    NSArray *animals = [timeline getAnimals];
    [self.backImage setImage:[UIImage imageNamed:[animals[backIndex] getFileName]]];
    [self sliderChanged:self];
    
    return true;
}
- (IBAction)right:(id)sender {
    self.leftButton.alpha = 0.3;
    NSArray *animals = [timeline getAnimals];
    if ([animal getOrder] + 1 == animals.count)
    {
        [self.slider setValue:animals.count - 1];
        [self sliderChanged:self];
        return;
    }
    if ([animal getOrder] + 1 == animals.count - 1)
    {
        self.rightButton.alpha = 0;
    }
    else self.rightButton.alpha = 0.3;
    
    [self.slider setValue:[animal getOrder] + 1];
    [self sliderChanged:self];
}

// skip to one animal to the left
- (IBAction)left:(id)sender {
    self.rightButton.alpha = 0.3;
    if ([animal getOrder] - 1 < 0)
    {
        [self.slider setValue:0];
        [self sliderChanged:self];
        return;
    }
    if ([animal getOrder] - 1 == 0)
    {
        self.leftButton.alpha = 0;
    }
    else self.leftButton.alpha = 0.3;
    
    [self.slider setValue:[animal getOrder] - 1];
    [self sliderChanged:self];
}

// from current location move through slider evolution
// if already playing, stop
- (IBAction)play:(id)sender {
    
    if(!play)                                   // if not playing, start firing events to move the slider
    {
        if ([self.slider value] >= [self.slider maximumValue])
        {
            [self.slider setValue:0];
            index = 0;
            backIndex = 1;
            NSArray *animals = [timeline getAnimals];
            [self.backImage setImage:[UIImage imageNamed:[animals[backIndex] getFileName]]];
            [self sliderChanged:self];
        }
        
        [self.playButton setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
        play = true;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2f
                                                    target:self
                                                    selector:@selector(moveSlider)
                                                    userInfo:nil
                                                    repeats:YES];
    }
    else                                        // if playing, stop timer
    {
        [self.playButton setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        [timer invalidate];
        play = false;
    }
}
- (void)fastPlay {
    
    if(!play)                                   // if not playing, start firing events to move the slider
    {
        if ([self.slider value] >= [self.slider maximumValue])
        {
            [self.slider setValue:0];
            index = 0;
            backIndex = 1;
            NSArray *animals = [timeline getAnimals];
            [self.backImage setImage:[UIImage imageNamed:[animals[backIndex] getFileName]]];
            [self sliderChanged:self];
        }
        
        [self.playButton setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
        play = true;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.004f
                                                 target:self
                                               selector:@selector(moveSlider)
                                               userInfo:nil
                                                repeats:YES];
    }
    else                                        // if playing, stop timer
    {
        [self.playButton setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        [timer invalidate];
        play = false;
    }
}
// slider has been moved, update animal info accordingly
- (IBAction)sliderChanged:(id)sender {
    
    int val = lroundf([self.slider value]);                 //round value of slider
    float opa = fabsf((float)val - [self.slider value]);    // get part of value past decimal point
    self.image.alpha = 1 - opa;                             // set opacity of front image
    self.backImage.alpha = opa;                             // set opactiy of back image
    NSArray *animals = [timeline getAnimals];
    
    self.rightButton.alpha = 0.3;
    self.leftButton.alpha = 0.3;
    if([self.slider value] == 0)
    {
        self.leftButton.alpha = 0;
    }
    
    if ([self.slider value] == animals.count - 1)
    {
        self.rightButton.alpha = 0;
    }
    
    // moving to the right and slider has passed current animal index and back image needs to
    // switch to the image one to the right of the current animal
    if([self.slider value] > index && backIndex <= index)
    {
        if(backIndex < animals.count - 1)
        {
            backIndex = index + 1;
            [self.backImage setImage:[UIImage imageNamed:[animals[backIndex] getFileName]]];            
        }
    }
    // moving the left and slider has passed current animal index and back image needs to
    // switch to the animal one to the left of the current animal
    else if([self.slider value] < index && backIndex >= index)
    {
        if(backIndex > 0)
        {
            backIndex = index - 1;
            [self.backImage setImage:[UIImage imageNamed:[animals[backIndex] getFileName]]];
        }
    }
    
    if(animal != animals[val]) [self changeAnimal:val];
}

// switch front animal and back animal
- (void)changeAnimal:(int) anim
{
    backIndex = index;
    index = anim;
    NSArray *animals = [timeline getAnimals];
    animal = animals[anim];
    self.timePeriod.text = [animal getYear];
    [self.image setImage:[UIImage imageNamed:[animal getFileName]]];
    [self.backImage setImage:[UIImage imageNamed:[animals[backIndex] getFileName]]];
    self.titleLabel.text = [animal getName];
    
    factNum = 0;
    
    if([[animal getFacts] count] > 0){
        [self.factView setText:[[animal getFacts] objectAtIndex:0]];
    }
    else{
        [self.factView setText:@"no fact yet "];
    }
}

- (IBAction)nextFact:(id)sender {
   
    factNum++;
    if([[animal getFacts] count] > factNum){
        [self.factView setText:[[animal getFacts] objectAtIndex:factNum]];
    }
    else{
        factNum = 0;
        if([[animal getFacts] count] > 0){
            [self.factView setText:[[animal getFacts] objectAtIndex:0]];
        }
        else{
            [self.factView setText:@"poop "];
        }
        
    }
}

// method for moving the slider when playing through the evolution
- (void)moveSlider
{
    // if we have reached the end of the timeline, stop the timer
    if(timer != nil && [self.slider value] >= [self.slider maximumValue])
    {
        [self.playButton setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        [timer invalidate];
        play = false;
        self.rightButton.alpha = 0.0;
        return;
    }
    
    // otherwise move the slider
    [self.slider setValue:[self.slider value] + 0.1];
    [self sliderChanged:self];

}
- (int)moveSliderAmount:(float)amount
{
    // if we have reached the end of the timeline, stop the timer
   /* if([self.slider value] >= [self.slider maximumValue])
    {
        //[self.playButton setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        //[timer invalidate];
       // play = false;
        //self.rightButton.alpha = 0.0;
        return 1;
    }
    if([self.slider value] <= [self.slider minimumValue])
    {
        //[self.playButton setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        //[timer invalidate];
        // play = false;
       // self.rightButton.alpha = 0.0;
        return -1;
    }*/
    
    // otherwise move the slider
    [self.slider setValue:[self.slider value] + amount];
    [self sliderChanged:self];
    return 0;
}


// set the Timeline for the view
- (void)setTimeline:(Timeline *)newDetailItem
{
    if (timeline != newDetailItem) {
        timeline = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}
- (void)preload:(UIImage *)image
{
    
    CGImageRef ref = image.CGImage;
    size_t width = CGImageGetWidth(ref);
    size_t height = CGImageGetHeight(ref);
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, width * 4, space, kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(space);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), ref);
    CGContextRelease(context);
    

}
// initial setup
- (void)configureView
{
    // Update the user interface for the detail item.
    
    self.rightButton.alpha = 0;
    [self.homeButton.titleLabel setFont:[UIFont fontWithName:@"Segoe Light" size:15]];
    
    if (timeline) {
        play = false;
        NSArray *animals = [timeline getAnimals];
        index = animals.count - 1;
        [self.slider setMaximumValue:index];
        [self.slider setValue:index];
        
        
         
        //[self fastPlay];
        
        [self changeAnimal:index];
        self.startDate.text = [animals[0] getYear];
        self.endDate.text = [animals[index] getYear];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[DejalBezelActivityView activityViewForView:self.view withLabel:@"loading animals..."];
    
    [self configureView];
    
}
- (void)viewDidAppear:(BOOL)animated{
    if (timeline) {
        play = false;
       // NSArray *animals = [timeline getAnimals];
        
        /*for(Animal* an in animals){
           
            [self preload:[UIImage imageNamed:[an getFileName]]];
           
        }*/
        
    }
    //[DejalActivityView removeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}


@end
