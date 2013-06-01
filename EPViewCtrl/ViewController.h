//
//  ViewController.h
//  EPViewCtrl
//
//  Created by Max Bazaliy on 03.04.13.
//  Copyright (c) 2013 R&R Music. All rights reserved.
//


#import <UIKit/UIKit.h>

NSString * const kDummyNotification;

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *countLabel;
@property (nonatomic, weak) IBOutlet UIButton *plusButton;
@property (nonatomic, weak) IBOutlet UIButton *minusButton;

- (IBAction)incrementCount:(id)sender;
- (IBAction)decrementCount:(id)sender;

@end
