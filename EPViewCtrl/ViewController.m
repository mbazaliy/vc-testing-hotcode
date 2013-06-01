//
//  ViewController.m
//  EPViewCtrl
//
//  Created by Max Bazaliy on 03.04.13.
//  Copyright (c) 2013 R&R Music. All rights reserved.
//


#import "ViewController.h"
#import "ViewController_ViewControllerExt.h"

NSString * const kDummyNotification = @"DummyNotification";

//@interface ViewController ()
//{
//    NSUInteger count;
//}
//
//- (void)onUpdate:(NSNotification *)notif;
//
//@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onUpdate:) name:kDummyNotification object:nil];
}

- (void)onUpdate:(NSNotification *)notif
{
    NSLog(@"Notified!");
}

- (IBAction)incrementCount:(id)sender
{
    count++;
    [_countLabel setText:[NSString stringWithFormat:@"%i", count]];
    [[NSNotificationCenter defaultCenter] postNotificationName:kDummyNotification object:nil];
}

- (IBAction)decrementCount:(id)sender
{
    count--;
    [_countLabel setText:[NSString stringWithFormat:@"%i", count]];
    [[NSNotificationCenter defaultCenter] postNotificationName:kDummyNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    if ([self isViewLoaded] && self.view.window == nil) {
        self.view = nil;
        self.countLabel = nil;
        self.plusButton = nil;
        self.minusButton = nil;
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
