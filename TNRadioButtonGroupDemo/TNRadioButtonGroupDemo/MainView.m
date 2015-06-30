//
//  MainView.m
//  TNRadioButtonGroupDemo
//
//  Created by Frederik Jacques on 22/04/14.
//  Copyright (c) 2014 Frederik Jacques. All rights reserved.
//

#import "MainView.h"

@interface MainView ()<TNRadioButtonGroupDelegate>
@end

@implementation MainView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        self.background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
        [self addSubview:self.background];
        
        [self createHorizontalList];
        [self createVerticalList];
        [self createHorizontalListWithImage];
    }
    
    return self;
}

- (void)createHorizontalList {
    TNCircularRadioButtonData *maleData = [TNCircularRadioButtonData new];
    maleData.labelText = @"Male";
    maleData.identifier = @"male";
    maleData.selected = YES;

    
    TNCircularRadioButtonData *femaleData = [TNCircularRadioButtonData new];
    femaleData.labelText = @"Female";
    femaleData.identifier = @"female";
    femaleData.selected = NO;
    femaleData.borderColor = [UIColor blackColor];
    femaleData.circleColor = [UIColor blackColor];
    femaleData.borderRadius = 12;
    femaleData.circleRadius = 5;
    
    TNCircularRadioButtonData *alienData = [TNCircularRadioButtonData new];
    alienData.labelText = @"Alien";
    alienData.identifier = @"alien";
    alienData.selected = NO;
    alienData.borderColor = [UIColor blackColor];
    alienData.circleColor = [UIColor blackColor];
    alienData.borderRadius = 12;
    alienData.circleRadius = 5;
    
    self.sexGroup = [[TNRadioButtonGroup alloc] initWithRadioButtonData:@[maleData, femaleData, alienData] layout:TNRadioButtonGroupLayoutHorizontal];
    self.sexGroup.identifier = @"Sex group";
    [self.sexGroup create];
    self.sexGroup.position = CGPointMake(25, 175);
    [self addSubview:self.sexGroup];
    self.sexGroup.delegate = self;
    
   

	// show how update data works...

    alienData.borderColor = [UIColor redColor];
    alienData.circleColor = [UIColor redColor];

	[self.sexGroup update];

}

- (void)createVerticalList {
    TNRectangularRadioButtonData *snowboardData = [TNRectangularRadioButtonData new];
    snowboardData.labelText = @"Snowboarding";
    snowboardData.identifier = @"snowboarding";
    snowboardData.selected = NO;
  
    
    TNRectangularRadioButtonData *tennisData = [TNRectangularRadioButtonData new];
    tennisData.labelText = @"Tennis";
    tennisData.identifier = @"tennis";
    tennisData.selected = YES;
    tennisData.borderColor = [UIColor blackColor];
    tennisData.rectangleColor = [UIColor blackColor];
    tennisData.borderWidth = tennisData.borderHeight = 12;
    tennisData.rectangleWidth = tennisData.rectangleHeight = 5;
    
    TNRectangularRadioButtonData *programmingData = [TNRectangularRadioButtonData new];
    programmingData.labelText = @"Programming";
    programmingData.identifier = @"programming";
    programmingData.selected = NO;
    programmingData.borderColor = [UIColor blackColor];
    programmingData.rectangleColor = [UIColor blackColor];
    programmingData.borderWidth = programmingData.borderHeight = 12;
    programmingData.rectangleWidth = programmingData.rectangleHeight = 5;
    
    self.hobbiesGroup = [[TNRadioButtonGroup alloc] initWithRadioButtonData:@[snowboardData,tennisData, programmingData] layout:TNRadioButtonGroupLayoutVertical];
    self.hobbiesGroup.identifier = @"Hobbies group";
    [self.hobbiesGroup create];
    self.hobbiesGroup.position = CGPointMake(25, 265);
    self.hobbiesGroup.delegate = self;

    [self addSubview:self.hobbiesGroup];
    
   	// show how update data works...

    programmingData.borderColor = [UIColor redColor];
    programmingData.rectangleColor = [UIColor redColor];

	[self.hobbiesGroup update];

}

- (void)createHorizontalListWithImage {
    TNImageRadioButtonData *coldData = [TNImageRadioButtonData new];
    coldData.labelText = @"Hot";
    coldData.identifier = @"hot";
    coldData.selected = YES;
    coldData.unselectedImage = [UIImage imageNamed:@"unchecked"];
    coldData.selectedImage = [UIImage imageNamed:@"checked"];
    
    TNImageRadioButtonData *hotData = [TNImageRadioButtonData new];
    hotData.labelText = @"Cold";
    hotData.identifier = @"cold";
    hotData.selected = NO;
    hotData.unselectedImage = [UIImage imageNamed:@"unchecked"];
    hotData.selectedImage = [UIImage imageNamed:@"checked"];
    
    self.temperatureGroup = [[TNRadioButtonGroup alloc] initWithRadioButtonData:@[coldData, hotData] layout:TNRadioButtonGroupLayoutVertical];
    self.temperatureGroup.identifier = @"Temperature group";
    [self.temperatureGroup create];
    self.temperatureGroup.position = CGPointMake(25, 400);
    self.temperatureGroup.delegate = self;
    
    [self addSubview:self.temperatureGroup];
    
    
}

- (void)sexGroupUpdated:(NSNotification *)notification {
    NSLog(@"[MainView] Sex group updated to %@", self.sexGroup.selectedRadioButton.data.identifier);
}

- (void)hobbiesGroupUpdated:(NSNotification *)notification {
    NSLog(@"[MainView] Hobbies group updated to %@", self.hobbiesGroup.selectedRadioButton.data.identifier);
}

- (void)temperatureGroupUpdated:(NSNotification *)notification {
    NSLog(@"[MainView] Temperature group updated to %@", self.temperatureGroup.selectedRadioButton.data.identifier);
}


#pragma mark - button group delegate

- (void)buttonGroup:(TNRadioButtonGroup *)group didSelectRadioButton:(TNRadioButton *)button {
    NSLog(@"callback using delegation %@", button.data.identifier);
}

@end
