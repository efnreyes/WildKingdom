//
//  ViewController.m
//  WildKingdom
//
//  Created by Efrén Reyes Torres on 8/8/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewCell.h"

#define FlickApiURL @"https://api.flickr.com/services/rest/?"
#define FlickrAPIKey @"606091ccce9e82a52788eb9ef3b07a47"

#define Tags @"lion,bear,tiger"

#define SearchMethod @"flickr.photos.search"
#define InfoMethod @"flickr.photos.getInfo"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property NSArray *photosInfo;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property NSMutableDictionary *photosImageDictionary;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];

    NSString *urlString = [NSString stringWithFormat:@"%@method=%@&api_key=%@&tags=%@&per_page=10&format=json&nojsoncallback=1",FlickApiURL, SearchMethod, FlickrAPIKey, Tags];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"# Error: %@", connectionError);
        } else {
            self.photosImageDictionary = [[NSMutableDictionary alloc] init];
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.photosInfo = results[@"photos"][@"photo"];

            NSString *photoStringUrl;
            NSURL *photoURL;

            for (NSDictionary *photoInfo in self.photosInfo) {
                photoStringUrl = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@_q.jpg", photoInfo[@"farm"], photoInfo[@"server"], photoInfo[@"id"], photoInfo[@"secret"]];
                photoURL = [NSURL URLWithString:photoStringUrl];

                // Asyncronous method to retrieve all the photos
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                    NSData *photoData = [NSData dataWithContentsOfURL:photoURL];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // Update the UI
                        [self.photosImageDictionary setObject:[UIImage imageWithData:photoData] forKey:photoStringUrl];
//                        if (self.photosImageDictionary.count == 10) {
//                            <#statements#>
//                        }
//                        NSLog(@"%d", self.photosImageDictionary.count);
                        [self.collectionView reloadData];
                    });
                });
            }
            [self.collectionView reloadData];
        }
    }];
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photosInfo.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"viewCellId" forIndexPath:indexPath];

    // https:// farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}_[mstzb].jpg
    NSDictionary *photoInfo = self.photosInfo[indexPath.row];
    NSString *photoStringUrl = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@_q.jpg", photoInfo[@"farm"], photoInfo[@"server"], photoInfo[@"id"], photoInfo[@"secret"]];

//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue-star"]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.photosImageDictionary[photoStringUrl]];
    cell.backgroundView = imageView;
    return cell;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize retval = CGSizeMake(150, 150);
    return retval;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 5, 20, 5);
}

@end
