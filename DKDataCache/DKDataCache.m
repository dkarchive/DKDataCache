//
//  DKDataCache.m
//
//  Created by Daniel Khamsing on 2/27/15.
//  Copyright (c) 2015 dkhamsing. All rights reserved.
//

#import "DKDataCache.h"

static const NSInteger kNumberOfSecondsToLive = 60 * 5;

static const NSString *kKeyDate = @"kKeyDate";

static const NSString *kkeyData = @"kKeyData";

@interface DKDataCache ()
@property (nonatomic, strong) NSMutableDictionary *cacheDictionary;
@end

@implementation DKDataCache

- (instancetype)init {
    self = [super init];
    if (!self)
        return nil;
    
    self.numberOfElements = 100;
    [self clearCache];
    
    return self;
}

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (void)cacheData:(NSData *)data forKey:(NSString *)key {
    if (self.cacheDictionary.count>self.numberOfElements) {
        if (self.log) {
            NSLog(@"DKDataCache reached limit of %@ elements", @(self.numberOfElements));
        }
        [self clearCache];
    }
    
    self.cacheDictionary[key] = @{
                                  kKeyDate:[NSDate date],
                                  kkeyData:data,
                                  };
}

- (void)clearCache {
    if (self.log) {
        NSLog(@"DKDataCache cache cleared");
    }
    self.cacheDictionary = [[NSMutableDictionary alloc] init];
}

- (NSData *)dataForKey:(NSString *)key {
    if (self.log) {
        NSLog(@"DKDataCache %@ is cached?", key);
        NSLog(@"DKDataCache cache keys = %@", self.cacheDictionary.allKeys);
    }
    
    if ([self.cacheDictionary.allKeys containsObject:key]) {
        NSDate *cacheDate = self.cacheDictionary[key][kKeyDate];
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *components = [calendar components:NSCalendarUnitSecond
                                                   fromDate:cacheDate
                                                     toDate:[NSDate date]
                                                    options:kNilOptions];
        
        if (components.second>kNumberOfSecondsToLive) {
            if (self.log) {
                NSLog(@"DKDataCache no");
            }
            return nil;
        }
        
        if (self.log) {
                NSLog(@"DKDataCache yes");
        }
        return self.cacheDictionary[key][kkeyData];
    }
    
    if (self.log) {
        NSLog(@"DKDataCache no");
    }
    
    return nil;
}

@end
