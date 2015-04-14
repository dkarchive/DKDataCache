//
//  ViewController.m
//  DKDataCacheDemo
//
//  Created by Daniel Khamsing on 4/13/15.
//  Copyright (c) 2015 dkhamsing. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewCell.h"
#import "DKDataCache.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ViewController

NSInteger imageSize = 80;
NSString *baseUrl = @"http://lorempixel.com";
NSInteger numberOfRows = 100;
NSString *cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"DKDataCache";
    
    [DKDataCache sharedInstance].log = YES;
    [DKDataCache sharedInstance].numberOfElements = 8;
    
    [self.tableView registerClass:[ImageViewCell class] forCellReuseIdentifier:cellId];
    
    self.dataSource = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < numberOfRows; index++) {
        [self.dataSource addObject:[NSString stringWithFormat:@"%@/%@/%@/cats/%@",
                                    baseUrl,
                                    @(imageSize),
                                    @(imageSize),
                                    @(arc4random() % 10)]];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    [[DKDataCache sharedInstance] clearCache];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return numberOfRows = numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell.textLabel.text = @(indexPath.row).stringValue;
    
    cell.photoView.image = nil;
    
    NSData *data = [[DKDataCache sharedInstance] dataForKey:self.dataSource[indexPath.row]];
    if (data) {
        cell.photoView.image = [UIImage imageWithData:data];
        return cell;
    }
    
    NSURL *url = [NSURL URLWithString:self.dataSource[indexPath.row]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            [[DKDataCache sharedInstance] cacheData:data forKey:self.dataSource[indexPath.row]];
            cell.photoView.image = [UIImage imageWithData:data];
        }
    }];
    
    return cell;
}

@end
