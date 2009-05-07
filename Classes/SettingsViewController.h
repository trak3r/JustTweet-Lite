//
//  SettingsViewController.h
//  JustTweet Lite
//
//  Created by Ted on 5/6/09.
//  Copyright 2009 Anachromystic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JustTweetAppDelegate.h" // for settings bundle key constants and view switch

@interface SettingsViewController : UIViewController {
	IBOutlet UITextField *usernameTextField;
	IBOutlet UITextField *passwordTextField;
}

@property (retain, nonatomic) UITextField *usernameTextField;
@property (retain, nonatomic) UITextField *passwordTextField;

- (IBAction)saveButtonPressed:(id)sender;

@end
