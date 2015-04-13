//
//  DKDataCache.h
//
//  Created by Daniel Khamsing on 2/27/15.
//  Copyright (c) 2015 dkhamsing. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Simple data cache. */
@interface DKDataCache : NSObject

/**
 Cache key.
 */
@property (nonatomic, strong) NSString *key;

/**
 Cache data.
 */
@property (nonatomic, strong) NSData *data;

/**
 Logging Boolean.
 */
@property (nonatomic) BOOL log;

/**
 Shared instance.
 @return Instance of data cache.
 */
+ (instancetype)sharedInstance;

/**
 Blow out the cache.
 */
- (void)clearCache;

/**
 Cache data
 @param data Data to cache.
 @param key Cache key.
 */
- (void)cacheData:(NSData *)data forKey:(NSString *)key;

/**
 Get cache data.
 @param key Cache key.
 @return Cache data for key. Nil is returned if the data is not cached.
 */
- (NSData *)dataForKey:(NSString *)key;

@end
