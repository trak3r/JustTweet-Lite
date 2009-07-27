//
//  TweetViewController.h
//  JustTweet Lite
//
//  Created by Ted on 5/6/09.
//  Copyright 2009 Anachromystic. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "JustTweetAppDelegate.h" // for settings bundle key constants

@interface TweetViewController : UIViewController <UITextViewDelegate, MMAdViewDelegate> {
	IBOutlet UINavigationItem *countDown;
	IBOutlet UITextView *tweetText;
	IBOutlet UIActivityIndicatorView *activityView;
	IBOutlet MMAdView *medialetsAdView;
}

@property (retain, nonatomic) UINavigationItem *countDown;
@property (retain, nonatomic) UITextView *tweetText;
@property (retain, nonatomic) UIActivityIndicatorView *activityView;
@property (retain, nonatomic) MMAdView *medialetsAdView;

- (IBAction)clearButtonPressed:(id)sender;
- (IBAction)tweetButtonPressed:(id)sender;
- (void)storeTweet;

@end
