WildKingdom
===========


As a user, I want to use the Flickr API to access the first 10 photos of lions and tigers and bears from the Flickr Creative Commons
2 points

    Setup a Flickr API key
    Connect to the Flickr API through a url connection

As a user, I want to display the images returned from Flickr in a two column grid layout
2 points

    Use a UICollectionView for the grid
    Create a custom UICollectionVewCell for image display

As a user, I want to tab between the lion, tiger, and bear image types
2 points

    Create a UITabBarController with 3 tabs
    Each tab should contain either an instance of a ViewController or separate ViewControllers, one for each type of image
    The preference is to use one ViewController type

As a user, I want to be able to rotate the device and have the layout change to a single roll of images that can be horizontally scrolled
3 points

    Using a combination of constraints / auto-layout and code, adjust the metrics of the UICollectionView when the the ViewController detects that the device has rotated
    Resize the UICollectionView and re-orient the scrollDirection

