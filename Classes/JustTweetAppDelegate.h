//
//  JustTweet_LiteAppDelegate.h
//  JustTweet Lite
//
//  Created by Ted on 5/6/09.
//  Copyright Anachromystic 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTwitterUsername @"twitter_username"
#define kTwitterPassword @"twitter_password"
#define kLastTweet @"last_tweet"

@class TweetViewController;
@class SettingsViewController;

@interface JustTweetAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TweetViewController *tweetViewController;
    SettingsViewController *settingsViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TweetViewController *tweetViewController;
@property (nonatomic, retain) IBOutlet SettingsViewController *settingsViewController;

- (void)showTweetView;
- (BOOL)hasValidAccountSettings;

@end

