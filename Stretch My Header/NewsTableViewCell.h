//
//  NewsTableViewCell.h
//  Stretch My Header
//
//  Created by Ian Tsai on 2015-06-09.
//  Copyright (c) 2015 Ian Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"

@interface NewsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@property (weak, nonatomic) IBOutlet UILabel *headlineLabel;

@property (nonatomic, strong) NewsItem *object;

-(void)setLabelTextColor;



@end
