//
//  demoViewController.swift
//  navigationTransDemo
//
//  Created by best su on 2018/8/14.
//  Copyright © 2018年 best su. All rights reserved.
//

import UIKit

class demoViewController: UIViewController, UINavigationControllerDelegate{

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.delegate = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.contents = UIImage.init(named: "222")?.cgImage
        self.view.backgroundColor = UIColor.black
//        setRound()
        setUI()
    }
    var icon: UIImage?
    var layer: CALayer?
    
    private func setRound(){
        let image = UIImageView()
        image.image = UIImage.init(named: "222")
        image.contentMode = UIViewContentMode.scaleAspectFill
        view.addSubview(image)
        
        image.center = view.center
        image.frame = CGRect(x: 50, y: 200, width: 300, height: 300)
        
        let demoLayer = CALayer.init()
        self.layer = demoLayer
        demoLayer.frame = image.bounds
        let icon = UIImage.init(named: "444")
        self.icon = icon
        demoLayer.contents = icon?.cgImage
        image.layer.mask = demoLayer
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.icon = UIImage.init(named: "333")
//        self.layer?.contents = icon?.cgImage
//
//    }
    
    private func setUI(){
        view.addSubview(demoBtn)
        demoBtn.frame = CGRect(x: screenWidth - 100, y: screenHeight - 100, width: 80, height: 80)
    }
    
    //    MARK: - navigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.pop{
            print("这个是pop")
//            let trans = Best_NaviTransformAnimator()
//            return trans
            return nil
        }
        return nil
    }
    
    @objc private func demoBtnClick(){
        self.navigationController?.popViewController(animated: true)
    }

    lazy var demoBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 40
        button.adjustsImageWhenHighlighted = false
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(demoBtnClick), for: .touchUpInside)
        return button
    }()
}
