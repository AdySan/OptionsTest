//
//  BaseTransitionAnimator.h
//  OptionsTest
//
//  Created by Aditya Tannu on 11/2/14.
//  Copyright (c) 2014 Aditya Tannu. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface BaseTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter = isAppearing) BOOL appearing;
@property (nonatomic, assign) NSTimeInterval duration;


@end
