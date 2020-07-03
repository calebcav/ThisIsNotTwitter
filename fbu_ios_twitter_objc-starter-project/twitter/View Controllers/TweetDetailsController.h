//
//  TweetDetailsController.h
//  twitter
//
//  Created by Caleb Caviness on 7/2/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
NS_ASSUME_NONNULL_BEGIN

@protocol TweetDetailsControllerDelegate

@end

@interface TweetDetailsController : UIViewController
@property (nonatomic, weak) id<TweetDetailsControllerDelegate> delegate;
@property (nonatomic, strong) Tweet *tweet;
@end

NS_ASSUME_NONNULL_END
