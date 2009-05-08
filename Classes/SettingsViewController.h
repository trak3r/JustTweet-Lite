//
//  SettingsViewController.h
//  JustTweet Lite
//
//  Created by Ted on 5/8/09.
//  Copyright 2009 Anachromystic. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JustTweetAppDelegate.h" // for settings bundle key constants

@interface SettingsViewController : UITableViewController {
	IBOutlet UITableViewCell *usernameTableCell;
	IBOutlet UITableViewCell *passwordTableCell;

	IBOutlet UITextField *usernameTextField;
	IBOutlet UITextField *passwordTextField;
}

@property (retain, nonatomic) UITableViewCell *usernameTableCell;
@property (retain, nonatomic) UITableViewCell *passwordTableCell;

@property (retain, nonatomic) UITextField *usernameTextField;
@property (retain, nonatomic) UITextField *passwordTextField;

- (IBAction)saveButtonPressed:(id)sender;

@end
