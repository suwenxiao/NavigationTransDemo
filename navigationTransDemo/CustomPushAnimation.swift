//
//  CustomPushAnimation.swift
//  navigationTransDemo
//
//  Created by best su on 2018/8/17.
//  Copyright © 2018年 best su. All rights reserved.
//

import UIKit

class CustomPushAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("\(#function)")
        
        transitionContext.containerView.backgroundColor = UIColor.white // 修改过渡时的背景颜色
        
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        
        transitionContext.containerView.insertSubview(toViewController.view, aboveSubview: fromViewController.view)
        
        toViewController.view.transform = CGAffineTransform(translationX: screenWidth, y: screenHeight)
        //通过以下方式,可以组合2个动画效果
        //      toViewController.view.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(-100, -100), CGAffineTransformMakeScale(2, 2))
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            toViewController.view.transform = CGAffineTransform.identity//CGAffineTransformIdentity
            fromViewController.view.transform = CGAffineTransform(translationX: -screenWidth, y: -screenHeight)
        }) { (completion) in
            fromViewController.view.transform = CGAffineTransform.identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
}
