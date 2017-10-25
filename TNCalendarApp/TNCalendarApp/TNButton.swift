//
//  TNButton.swift
//  TNUtility
//
//  Created by 涂育旺 on 2017/8/29.
//  Copyright © 2017年 tuyuwang. All rights reserved.
//

import UIKit

enum ExtensionType: Int {
    
    case left     //图片在左边(default)
    case top      //图片在上边
    case right    //图片在右边
    case bottom   //图片在下面
}

class TNButton: UIButton {

    private var extensionType: ExtensionType!
    private var space: CGFloat!
    private var edge: CGFloat!
    private var maxValue: CGFloat!
    private var imageSize: CGSize! = CGSize.zero
    
    convenience init(type buttonType: ExtensionType) {
        
        self.init()
        self.edge = 0.toPixel()     //对button四边的内间距，设置非0后snp使用不准确，需要矫正
        self.maxValue = 0
        self.extensionType = buttonType
        self.titleLabel?.font = SFont(font: 18)
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.setSpace(10)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        //这边多次layout，titleLabel的width会多次改变，取最大的为准
        maxValue = max((self.titleLabel?.width)!, maxValue)
        
        self.makeImageConstraint()
        self.makeTitleConstraint()
        self.makeSelfConstraints()
    }
    
    override var isHighlighted: Bool{
        
        get{
            return super.isHighlighted
        }
        
        set{
            //重写父类，作用：按住不显示灰暗色
        }
    }
    
    public func setSpace(_ space: Int) {
        self.space = space.toPixel()
        self.layoutSubviews()
    }
    
    public func setEdge(_ edge: Int) {
        self.edge = edge.toPixel()
        self.layoutSubviews()
    }
    
    public func setImageSize(_ size: CGSize) {
        imageSize = size
    }
    
    private func makeImageConstraint() {
        
        var frame = CGRect(x: 0, y: 0, width: (self.imageView?.width)!, height: (self.imageView?.height)!)
        var center = CGPoint.zero
        
        switch extensionType as ExtensionType {
            
        case .top:
            center = CGPoint(x: width/2, y: edge+(self.imageView?.height)!/2)
            break
        case .right:
            center = CGPoint(x: edge+space+maxValue+(self.imageView?.width)!/2, y: height/2)
            break
        case .bottom:
            center = CGPoint(x: width/2, y: (self.titleLabel?.frame.maxY)!+space+(self.imageView?.height)!/2)
            break
        default:
            center = CGPoint(x: (self.imageView?.width)!/2+edge, y: height/2)
            break
        }
        frame = imageSize == CGSize.zero ? frame : CGRect(origin: frame.origin, size: imageSize)
        self.imageView?.frame = frame
        self.imageView?.center = center
    }
    
    private func makeTitleConstraint() {
        
        let frame = CGRect(x: 0, y: 0, width: maxValue, height: (self.titleLabel?.height)!)
        var center = CGPoint.zero
        
        switch extensionType as ExtensionType{
            
        case .top:
            center = CGPoint(x: width/2, y: (self.imageView?.frame.maxY)!+(self.titleLabel?.height)!/2+space)
            break
        case .right:
            center = CGPoint(x: edge+maxValue/2, y: height/2)
            break
        case .bottom:
            center = CGPoint(x: width/2, y: edge+(self.titleLabel?.height)!/2)
        default:
            center = CGPoint(x: edge+(self.imageView?.width)!+space+(self.titleLabel?.width)!/2, y: (self.imageView?.center.y)!)
            break
        }
        
        self.titleLabel?.frame = frame
        self.titleLabel?.center = center
    }
    
    private func makeSelfConstraints() {
        let frame = self.frame
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        switch extensionType as ExtensionType {
        case .top:
            width  = edge*2+max(maxValue, (self.imageView?.width)!)
            height = edge*2+(self.imageView?.height)!+space+(self.titleLabel?.height)!
            break
        case .bottom:
            width  = edge*2+max(maxValue, (self.imageView?.width)!)
            height = edge*2+(self.imageView?.height)!+space+(self.titleLabel?.height)!
            break
        default:
            width  = edge*2+(self.imageView?.width)!+space+(self.titleLabel?.width)!
            height = edge*2+max((self.imageView?.height)!, (self.titleLabel?.height)!)
            break
        }
        width = max(frame.width, width)
        height = max(frame.height, height)
        self.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: width, height: height)
    }
    
}

