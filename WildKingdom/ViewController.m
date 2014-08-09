//
//  ViewController.m
//  WildKingdom
//
//  Created by Efrén Reyes Torres on 8/8/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#define FlickrAPIKey @"606091ccce9e82a52788eb9ef3b07a47"
#define Search @"lion"


@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property NSMutableArray *pictures;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *urlString = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&per_page=10&format=json&nojsoncallback=1", FlickrAPIKey, Search];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"# Error: %@", connectionError);
        } else {
            self.pictures = [[NSMutableArray alloc] init];
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *photos = results[@"photos"][@"photo"];
        }
    }];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
