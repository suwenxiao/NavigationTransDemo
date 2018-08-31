//
//  Best_NaviTransformAnimator.swift
//  navigationTransDemo
//
//  Created by best su on 2018/8/14.
//  Copyright © 2018年 best su. All rights reserved.
//

import UIKit

class Best_NaviTransformAnimator: NSObject, UIViewControllerAnimatedTransitioning, CAAnimationDelegate{
    
    var context: UIViewControllerContextTransitioning?
    var radius: CGFloat = 0
    var toVc: UIViewController?
    

}

extension Best_NaviTransformAnimator{
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.context = transitionContext
        // 获取容器视图
        transitionContext.containerView.backgroundColor = UIColor.white
        let containerView: UIView = transitionContext.containerView
        // 初始化toVc， 将toVc的view添加到容器视图的view中
        let toVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
//        containerView.addSubview((toVc?.view)!)
        let fromVc: ViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)! as! ViewController
        
        containerView.insertSubview((toVc.view)!, aboveSubview: fromVc.view)
        
        self.toVc = toVc
        //        transitionContext.completeTransition(true)
        //        获取fromVc
        let btn = fromVc.demoBtn
        //        小圆路径
        let smPath = UIBezierPath.init(ovalIn: btn.frame)
        //        大圆半径 圆心
        let smBtnCenterP = btn.center
        
        //        MAKR:  - 判断是在哪个象限中 目的是为了求大圆的半径
        if btn.center.x > screenWidth/2{ //表示在第一四象限
            if btn.center.y < screenHeight/2{ //表示在第一象限
                self.radius = CGFloat(sqrtf(Float(btn.center.x * btn.center.x + (screenHeight - btn.center.y) * (screenHeight - btn.center.y))))
                print("第一象限",self.radius)
            }else{ //表示在第四象限
                self.radius = CGFloat(sqrtf(Float(btn.center.x * btn.center.x + btn.center.y * btn.center.y)))
                print("第四象限",self.radius)
            }
        }else{ //表示在第二三象限
            if btn.center.y < screenHeight/2{ //表示在第二象限
                self.radius = CGFloat(sqrtf(Float((screenWidth - btn.center.x) * (screenWidth - btn.center.x) + (screenHeight - btn.center.y) * (screenHeight - btn.center.y))))
                print("第二象限",self.radius)
            }else{ //表示在第三象限
                self.radius = CGFloat(sqrtf(Float((screenWidth - btn.center.x) * (screenWidth - btn.center.x) + btn.center.y * btn.center.y)))
                print("第三象限",self.radius)
            }
        }
        
        let bigPath = UIBezierPath.init(arcCenter: smBtnCenterP, radius: self.radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        let shapLayer = CAShapeLayer.init()
        shapLayer.path = bigPath.cgPath
        toVc.view.layer.mask = shapLayer
        
        
        let baseAniman = CABasicAnimation.init(keyPath: "path")
        baseAniman.fromValue = smPath.cgPath
        baseAniman.duration = self.transitionDuration(using: transitionContext)
        baseAniman.delegate = self
        shapLayer.add(baseAniman, forKey: "base")
        
    }
    
    /// animatorDelete  动画代理方法
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.context?.completeTransition(true)
        self.toVc?.view.layer.mask = nil
        print("动画结束")
    }
}

