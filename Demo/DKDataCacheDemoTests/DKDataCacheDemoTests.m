//
//  DKDataCacheDemoTests.m
//  DKDataCacheDemoTests
//
//  Created by Daniel Khamsing on 4/13/15.
//  Copyright (c) 2015 dkhamsing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DKDataCache.h" 

@interface DKDataCacheDemoTests : XCTestCase

@end

@implementation DKDataCacheDemoTests

NSString *key = @"key";

- (void)setUp {
    [super setUp];
    
    
    NSInteger size = 10;
    NSMutableData* theData = [NSMutableData dataWithCapacity:size];
    for(NSInteger i = 0 ; i < size/4 ; ++i )
    {
        u_int32_t randomBits = arc4random();
        [theData appendBytes:(void*)&randomBits length:4];
    }
    
    [[DKDataCache sharedInstance] cacheData:theData forKey:key];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test {
    id data = [[DKDataCache sharedInstance] dataForKey:key] ;    
    XCTAssertTrue(data != nil, @"");
    XCTAssertTrue([data isKindOfClass:[NSData class]], @"");
}


@end
