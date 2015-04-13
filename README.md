# DKDataCache

Simple iOS Data Cache

[![Build Status](https://travis-ci.org/dkhamsing/DKDataCache.svg?branch=master)](https://travis-ci.org/dkhamsing/DKDataCache)
[![Version](https://img.shields.io/cocoapods/v/DKDataCache.svg?style=flat)](http://cocoadocs.org/docsets/DKDataCache)
[![License](https://img.shields.io/cocoapods/l/DKDataCache.svg?style=flat)](http://cocoadocs.org/docsets/DKDataCache)
[![Platform](https://img.shields.io/cocoapods/p/DKDataCache.svg?style=flat)](http://cocoadocs.org/docsets/DKDataCache)

# Installation

## Cocoapods
``` ruby
pod 'DKDataCache'
```

## Manual
Add the files in the DKDataCache folder to your project.

# Usage
``` objc
NSString *key = @"http://lorempixel.com/100/100/cats/2/";

// get cache
NSData *data = [[DKDataCache sharedInstance] dataForKey:key];

if (data) {
  UIImage *image = [UIImage imageWithData:data];
  // yay
  return;
}

NSURL *url = [NSURL URLWithString:key];
NSURLRequest *request = [NSURLRequest requestWithURL:url];
[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
  if (data) {
    // set cache
    [[DKDataCache sharedInstance] cacheData:data forKey:key];
    UIImage *image = [UIImage imageWithData:data];
    // nice
  }
}];
```

# Demo
DKDataCache includes a sample project in the `Demo` folder.

# Contact
- [github.com/dkhamsing](https://github.com/dkhamsing)
- [twitter.com/dkhamsing](https://twitter.com/dkhamsing)
- [Send a message](http://dkhamsing.tumblr.com/ask)

# License
DKDataCache is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
