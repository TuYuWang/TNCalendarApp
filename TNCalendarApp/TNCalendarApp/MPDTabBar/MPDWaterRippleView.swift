//
//  MPDWaterRippleView.swift
//  MPD
//
//  Created by 涂育旺 on 2017/6/13.
//  Copyright © 2017年 Qianhai Jiutong. All rights reserved.
//

import UIKit

class MPDWaterRippleView: UIView {
    
    let waveSize = CGSize(width: 135*widthFor750, height: 135*widthFor750)
    let duration = 0.8
    
    
    open class func showInView(view: UIView, center: CGPoint) {
    
        let rippleView = MPDWaterRippleView()
        rippleView.setFrameWithCenter(center: center)
        view.insertSubview(rippleView, at: 0)
    }
    
    func setFrameWithCenter(center: CGPoint) {
        self.frame = CGRect(x: center.x-waveSize.width*0.5, y: center.y-waveSize.height*0.5, width: waveSize.width, height: waveSize.height)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        let waveLayer = CAShapeLayer()
        waveLayer.backgroundColor = UIColor.clear.cgColor
        waveLayer.opacity = 0.6
        waveLayer.fillColor = HexFBE5CD.cgColor
        self.layer.addSublayer(waveLayer)
        self.startAnimationInLayar(layer: waveLayer)
    }
    
    func startAnimationInLayar(layer: CALayer) {
        let pathCenter = CGPoint(x: waveSize.width*0.5, y: waveSize.height*0.5)
        let animationBeginRadius = waveSize.width*0.5*0.2
        let animationEndRadius = waveSize.width*0.5
        
        let beginPath = UIBezierPath.init(arcCenter: pathCenter, radius: animationBeginRadius, startAngle: 0, endAngle:.pi*2.0, clockwise: true)
        let endPath = UIBezierPath.init(arcCenter: pathCenter, radius: animationEndRadius, startAngle: 0, endAngle:.pi*2.0, clockwise: true)
        
        let rippleAnimation = CABasicAnimation.init(keyPath: "path")
        rippleAnimation.delegate = self
        rippleAnimation.fromValue = beginPath.cgPath
        rippleAnimation.toValue = endPath.cgPath
        rippleAnimation.duration = duration
        
        let opacityAnimation = CABasicAnimation.init(keyPath: "opacity")
        opacityAnimation.delegate = self
        opacityAnimation.fromValue = 0.6
        opacityAnimation.toValue = 0.0
        opacityAnimation.duration = duration
        
        layer.add(rippleAnimation, forKey: "rippleAnimation")
        layer.add(opacityAnimation, forKey: "opacityAnimation")
    }
}

extension MPDWaterRippleView: CAAnimationDelegate {

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            self.removeFromSuperview()
        }
    }

}
