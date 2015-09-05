//
//  ViewController.m
//  OptionsTest
//
//  Created by Aditya Tannu on 11/2/14.
//  Copyright (c) 2014 Aditya Tannu. All rights reserved.
//

#import "ViewController.h"
#import "OptionsTransitionAnimator.h"
#import "OptionsViewController.h"


static NSString * const kSegueOptionsDismiss = @"optionsDismiss";
static NSString * const kSegueDropDismiss    = @"dropDismiss";
static NSString * const kSegueOptionsModal   = @"optionsModal";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Options - modal
    if ([segue.identifier isEqualToString:kSegueOptionsModal]) {
        UIViewController *toVC = segue.destinationViewController;
        toVC.modalPresentationStyle = UIModalPresentationCustom;
        toVC.transitioningDelegate = self;
    }
}

#pragma mark - UIViewControllerTransitioningDelegate

/*
 Called when presenting a view controller that has a transitioningDelegate
 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    id<UIViewControllerAnimatedTransitioning> animationController;
    
    // Options
    if ([presented isKindOfClass:[UINavigationController class]] &&
        [((UINavigationController *)presented).topViewController isKindOfClass:[OptionsViewController class]]) {
        OptionsTransitionAnimator *animator = [[OptionsTransitionAnimator alloc] init];
        animator.appearing = YES;
        animator.duration = 0.35;
        animationController = animator;
    }
    return animationController;
}

/*
 Called when dismissing a view controller that has a transitioningDelegate
 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    id<UIViewControllerAnimatedTransitioning> animationController;
   
    // Options
    if ([dismissed isKindOfClass:[UINavigationController class]] &&
        [((UINavigationController *)dismissed).topViewController isKindOfClass:[OptionsViewController class]]) {
        OptionsTransitionAnimator *animator = [[OptionsTransitionAnimator alloc] init];
        animator.appearing = NO;
        animator.duration = 0.35;
        animationController = animator;
    }
    return animationController;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Storyboard unwinding

/*
 Unwind segue action called to dismiss the Options and Drop view controllers and
 when the Slide, Bounce and Fold view controllers are dismissed with a single tap.
 
 Normally an unwind segue will pop/dismiss the view controller but this doesn't happen
 for custom modal transitions so we have to manually call dismiss.
 */
- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender
{
    NSLog(sender.identifier);
    
    if ([sender.identifier isEqualToString:kSegueOptionsDismiss] || [sender.identifier isEqualToString:kSegueDropDismiss]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
