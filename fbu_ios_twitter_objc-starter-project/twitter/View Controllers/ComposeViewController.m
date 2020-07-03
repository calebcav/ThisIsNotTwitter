//
//  ComposeViewController.m
//  twitter
//
//  Created by Caleb Caviness on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "Tweet.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *statusText;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.autofill){
        self.statusText.text = self.autofill;
    }
    
    // Do any additional setup after loading the view.
}



- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


- (IBAction)tweetButton:(id)sender {
    [[APIManager shared] postStatusWithText:self.statusText.text completion:^(Tweet *tweet, NSError *error){
        if (error) {
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else {
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
        }
        [self dismissViewControllerAnimated:true completion:nil];
    }];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
