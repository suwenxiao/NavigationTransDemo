//
//  CricleViewController.swift
//  navigationTransDemo
//
//  Created by best su on 2018/8/17.
//  Copyright © 2018年 best su. All rights reserved.
//

import UIKit

class CricleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange
        
        view.addSubview(centerView)
        centerView.center = view.center
        centerView.bounds = CGRect(x: 0, y: 0, width: 60, height: 60)
    }
    
    
    @objc private func btnClick(){
        
//        let smPath = UIBezierPath.init(ovalIn: centerView.frame)
//        let bigCenterP = centerView.center
//
//        let bigPath = UIBezierPath.init(arcCenter: bigCenterP, radius: 300, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
//
////        let shapLayer = CAShapeLayer.init()
//        let baseAniman = CABasicAnimation.init(keyPath: "path")
//        baseAniman.beginTime = CACurrentMediaTime()
//        baseAniman.fromValue = smPath
//        baseAniman.toValue = bigPath
//        baseAniman.duration = 2
////        shapLayer.fillColor = UIColor.red.cgColor
////        self.view.layer.addSublayer(shapLayer)
//        view.layer.add(baseAniman, forKey: "base")
        //        shapLayer.frame =
//        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//        animation.duration = 2.5; // 动画持续时间
//        animation.repeatCount = 1; // 重复次数
//        animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
//        animation.toValue = [NSNumber numberWithFloat:2.0]; // 结束时的倍率
//        [myView.layer addAnimation:animation forKey:@"scale-layer"];
//
        
        
        
        
        let anima = CABasicAnimation.init(keyPath: "transform.scale")
        anima.duration = 1
        anima.isRemovedOnCompletion = false;
        anima.fillMode = kCAFillModeForwards;
        anima.repeatCount = MAXFLOAT
        anima.fromValue = 1.0
        anima.toValue = 2.0
        
        self.centerView.layer.add(anima, forKey: nil)
        
    }
    
    
    
    private lazy var centerView: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 30
        view.backgroundColor = UIColor.white
        view.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return view
    }()
}
