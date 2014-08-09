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

Stretches
=========


As a user, I want to see where the photo was taken on a map
2 points

    The map should be displayed in a full screen


As a user, I want to view more information about the photo
2 points

    Tapping the image should flip it around and display more information


As a user, I want to browse other artwork by the photographer who took this picture
3 points

No engineering tasks


As a user, I want to see an overlay of interesting information about the images when the image is tapped
2 points

    The overlay should take up the lower 1/4 of the image and have a gradient from black to clear
    Something like this…

http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/pictures/1/content_8236eebc-8aa3-4fc7-b832-71df8fa7a4d0.tiff
