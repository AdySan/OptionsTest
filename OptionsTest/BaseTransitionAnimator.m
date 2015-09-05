//
//  BaseTransitionAnimator.m
//  OptionsTest
//
//  Created by Aditya Tannu on 11/2/14.
//  Copyright (c) 2014 Aditya Tannu. All rights reserved.
//

#import "BaseTransitionAnimator.h"

static NSTimeInterval const kDefaultDuration = 1.0;

@implementation BaseTransitionAnimator

- (id)init
{
    self = [super init];
    if (self) {
        _duration = kDefaultDuration;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // Must be implemented by inheriting class
    [self doesNotRecognizeSelector:_cmd];
}

@end