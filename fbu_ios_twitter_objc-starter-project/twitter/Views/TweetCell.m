//
//  TweetCell.m
//  twitter
//
//  Created by Caleb Caviness on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "Tweet.h"
#import "APIManager.h"
@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTapFavorite:(id)sender {
    self.tweetObject.favorited = YES;
    self.tweetObject.favoriteCount += 1;
    [self.favButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
    [[APIManager shared] favorite:self.tweetObject completion:^(Tweet *tweet, NSError *error){
        if (tweet){
            NSLog(@"Error favoriting Tweet: %@", error.localizedDescription);
        }
        else {
            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
        }
    }];
}
- (IBAction)didRetweet:(id)sender {
    self.tweetObject.retweeted = YES;
    self.tweetObject.retweetCount += 1;
    [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
    [[APIManager shared] retweet:self.tweetObject completion:^(Tweet *tweet, NSError *error){
        if (tweet){
            NSLog(@"Error retweeting Tweet: %@", error.localizedDescription);
        }
        else {
            NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
        }
    }];
}


@end
