//
//  CustomCollectionCell.h
//  Evo
//
//  Created by Chad Swenson on 8/4/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *animalImg;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UILabel *desc;

@end
