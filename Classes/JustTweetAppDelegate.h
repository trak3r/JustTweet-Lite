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

@interface JustTweetAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIView *tweetView;
    UIView *settingsView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIView *tweetView;
@property (nonatomic, retain) IBOutlet UIView *settingsView;

- (void)showTweetView;
- (BOOL)hasValidAccountSettings;

@end

