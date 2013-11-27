//
//  CustomFontSegoeLight.m
//  Evo
//
//  Created by Ashley Schneider on 3/18/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import "CustomFontSegoeLight.h"

@implementation CustomFontSegoeLight

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
   // [super awakeFromNib];
   // self.font = [UIFont fontWithName:@"Segoe Light" size:self.font.pointSize];
    //[self sizeToFit];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
