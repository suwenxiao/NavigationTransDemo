//
//  ViewController.swift
//  navigationTransDemo
//
//  Created by best su on 2018/8/14.
//  Copyright © 2018年 best su. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

class ViewController: UIViewController, UINavigationControllerDelegate {

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.contents = UIImage.init(named: "111")?.cgImage
        
        view.addSubview(demoBtn)
        demoBtn.frame = CGRect(x: screenWidth - 100, y: screenHeight - 100, width: 80, height: 80)
    }
    
    //    MARK: - navigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.push{
            print("这个是push")
            let trans = Best_NaviTransformAnimator()
            return trans
            
        }
        return nil
    }
    
    

    @objc private func demoBtnClick(){

//        let path = UIBezierPath.init()
//        path.move(to: CGPoint(x: 20, y: 200))
//        path.addCurve(to: CGPoint(x: 300, y: 200), controlPoint1: CGPoint(x: 100, y: 100), controlPoint2: CGPoint(x: 200, y: 300))
//
//        let shapeLayer = CAShapeLayer.init()
//        shapeLayer.path = path.cgPath
//        shapeLayer.fillColor = nil
//        shapeLayer.strokeColor = UIColor.orange.cgColor
//        view.layer.addSublayer(shapeLayer)
        let vc = demoViewController()
//        let vc = CricleViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    lazy var demoBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 40
        button.adjustsImageWhenHighlighted = false
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(demoBtnClick), for: .touchUpInside)
        return button
    }()

}

