//
//  TweetDetailsController.m
//  twitter
//
//  Created by Caleb Caviness on 7/2/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetDetailsController.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "ComposeViewController.h"

@interface TweetDetailsController ()
@property (weak, nonatomic) IBOutlet UILabel *twitterName;
@property (weak, nonatomic) IBOutlet UILabel *twitterHandle;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *twitterTweet;
@property (weak, nonatomic) IBOutlet UIButton *retweet;
@property (weak, nonatomic) IBOutlet UIButton *favorite;

@end

@implementation TweetDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.twitterName.text = self.tweet.user.name;
    self.twitterHandle.text = self.tweet.user.screenName;
    self.twitterTweet.text = self.tweet.text;
    
    NSURL *pictureURL = [NSURL URLWithString:self.tweet.user.profileURL];
    self.profilePicture.image = nil;
    [self.profilePicture setImageWithURL:pictureURL];
    
    
    
    // Do any additional setup after loading the view.
}
- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)retweetButton:(id)sender {
    if (!self.tweet.retweeted) {
        [self.retweet setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error){
            if (tweet) {
                NSLog(@"Aye");
            }
            else {
                NSLog(@"Damn");
            }
        }];
    }
}

- (IBAction)favoriteButton:(id)sender {
    if (!self.tweet.favorited) {
        [self.favorite setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error){
            if (tweet) {
                NSLog(@"Aye");
            } else {
                NSLog(@"Damn");
            }
        }];
    }
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqual:@"replyTweet"]){
        ComposeViewController *composeViewController = (ComposeViewController *)[segue destinationViewController];
        composeViewController.autofill = [@"@"stringByAppendingFormat: self.tweet.user.screenName];
    }
    
}

@end
