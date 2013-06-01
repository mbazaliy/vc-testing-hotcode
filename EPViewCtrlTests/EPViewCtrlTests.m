//
//  EPViewCtrlTests.m
//  EPViewCtrlTests
//
//  Created by Max Bazaliy on 03.04.13.
//  Copyright (c) 2013 R&R Music. All rights reserved.
//


#import <SenTestingKit/SenTestingKit.h>
#import "ViewController.h"
#import <OCMock/OCMock.h>
#import "ViewController_ViewControllerExt.h"

@interface EPViewCtrlTests : SenTestCase
{
    ViewController *sut;
}
@end

@implementation EPViewCtrlTests

- (void)setUp
{
    [super setUp];
    
    sut = [[ViewController alloc] init];
}

- (void)tearDown
{
    sut = nil;
    
    [super tearDown];
}

#pragma mark  - Outlets hooks
- (void)testCountLabelIsConnected
{
    [sut view];
    
    STAssertNotNil([sut countLabel], @"countLabel should not be nil!");
}

- (void)testPlusButtonIsConnected
{
    [sut view];
    
    STAssertNotNil([sut plusButton], @"plusButton should not be nil!");
}

- (void)testMinusButtonIsConnected
{
    [sut view];
    
    STAssertNotNil([sut minusButton], @"");
}

#pragma Mark - Initial state
- (void)testInitialCountLabelIsZero
{
    [sut view];
    
    STAssertEqualObjects([[sut countLabel] text], @"0", @"CountLabel text should be zero!");
}


#pragma mark  - IBActions hooks
- (void)testPlusButtonAction
{
    [sut view];
    
    STAssertTrue([[[sut plusButton] actionsForTarget:sut
                                     forControlEvent:UIControlEventTouchUpInside]
                  containsObject:NSStringFromSelector(@selector(incrementCount:))], @"");
}

#pragma mark - Invoke directly
- (void)testIncrementCountAddsOneToCountLabel
{
    [sut view];
    
    [sut incrementCount:nil];
    
    STAssertEqualObjects([[sut countLabel] text], @"1", @"");
}

- (void)testIncrementCountTwiceAddsTwoToCountLabel
{
    [sut view];
    
    [sut incrementCount:nil];
    [sut incrementCount:nil];
    
    STAssertEqualObjects([[sut countLabel] text], @"2", @"");
}


- (void)testDecrementCountSubstractsOneFromCountLabel
{
    [sut view];
    
    [sut decrementCount:nil];
    
    STAssertEqualObjects([[sut countLabel] text], @"-1", @"");
}

- (void)testDecrementCountTwiceSubstractsTwoFromCountLabel
{
    [sut view];
    
    [sut decrementCount:nil];
    [sut decrementCount:nil];
    
    STAssertEqualObjects([[sut countLabel] text], @"-2", @"");
}

- (void)testViewUnloading {
    [sut loadView];
    STAssertNotNil([sut view], @"");
    
    [sut didReceiveMemoryWarning];
    STAssertFalse([sut isViewLoaded], @"");
    
    STAssertNil([sut countLabel], @""); //sut.view will call loadView and re-init view
    
    [sut loadView];
    STAssertNotNil([sut view], @"");
}

@end
