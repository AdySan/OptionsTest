//
//  OptionsTransitionAnimator.m
//  OptionsTest
//
//  Created by Aditya Tannu on 11/2/14.
//  Copyright (c) 2014 Aditya Tannu. All rights reserved.
//

#import "OptionsTransitionAnimator.h"

@implementation OptionsTransitionAnimator

#pragma mark - UIViewControllerAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // Presenting
    if (self.appearing) {
        fromView.userInteractionEnabled = NO;
        
        // Round the corners
        toView.layer.cornerRadius = 5;
        toView.layer.masksToBounds = YES;
        
        // Set initial scale to zero
        toView.transform = CGAffineTransformMakeScale(0.0, 0.0);
        [containerView addSubview:toView];
        
        // Scale up to 90%
        [UIView animateWithDuration:duration animations: ^{
            toView.transform = CGAffineTransformMakeScale(0.9, 0.9);
            fromView.alpha = 0.5;
        } completion: ^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    // Dismissing
    else {
        
        // Scale down to 0
        [UIView animateWithDuration:duration animations: ^{
            fromView.transform = CGAffineTransformMakeScale(0.0, 0.0);
            toView.alpha = 1.0;
        } completion: ^(BOOL finished) {
            [fromView removeFromSuperview];
            toView.userInteractionEnabled = YES;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}

@end