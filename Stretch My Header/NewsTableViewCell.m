//
//  NewsTableViewCell.m
//  Stretch My Header
//
//  Created by Ian Tsai on 2015-06-09.
//  Copyright (c) 2015 Ian Tsai. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}
-(void)setObject:(NewsItem *)object {
    
    _object = object;
    
    [self configure];
    
}

-(void)configure {
    
    self.categoryLabel.text = self.object.category;
    [self setLabelTextColor];
    
    self.headlineLabel.text = self.object.headline;

}

-(void)setLabelTextColor {
    
    if ([self.categoryLabel.text isEqualToString:@"World"]) {
        
        [self.categoryLabel setTextColor:[UIColor blueColor]];
        
    }
    else if ([self.categoryLabel.text isEqualToString:@"Americas"]) {
        
        self.categoryLabel.textColor = [UIColor redColor];

    }
    else if ([self.categoryLabel.text isEqualToString:@"Europe"]) {
        
        self.categoryLabel.textColor = [UIColor yellowColor];
    }
    else if ([self.categoryLabel.text isEqualToString:@"Middle East"]) {
        
        self.categoryLabel.textColor = [UIColor purpleColor];
        
    }
    else if ([self.categoryLabel.text isEqualToString:@"Africa"]) {
        
        self.categoryLabel.textColor = [UIColor orangeColor];
        
    }
    else if ([self.categoryLabel.text isEqualToString:@"Asia Pacific"]) {
        
        self.categoryLabel.textColor = [UIColor magentaColor];
    }
    
}


@end
