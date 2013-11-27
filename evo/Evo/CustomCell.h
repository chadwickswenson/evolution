//
//  CustomCell.h
//  Evo
//
//  Created by Ashley Schneider on 3/19/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomFontSegoeLight.h"

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet CustomFontSegoeLight *title;
@property (weak, nonatomic) IBOutlet UIImageView *image;


@end
