//
//  MPDTabBarButton.swift
//  MPD
//
//  Created by 涂育旺 on 2017/6/12.
//  Copyright © 2017年 Qianhai Jiutong. All rights reserved.
//

import UIKit

class MPDTabBarButton: UIButton {

    var extensionScale: Int = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRect(x: self.width/2 - (25.toPixel()+extensionScale.toPixel()/2), y: (130.toPixel()-(extensionScale.toPixel())-50.toPixel())/2, width: (50.toPixel()+extensionScale.toPixel()), height: (50.toPixel()+extensionScale.toPixel()))
        self.titleLabel?.frame = CGRect(x: 0, y: heightFor1334*58, width: self.width, height: heightFor1334*44)
        self.titleLabel?.font = SFont(font: 23)
        self.titleLabel?.textAlignment = NSTextAlignment.center
    }
    
    override var isHighlighted: Bool{
        
        get{
            return super.isHighlighted
        }
        
        set{
            //重写父类，作用：按住不显示灰暗色
        }
    }
}

class TNButton: UIButton {
    override var isHighlighted: Bool {
        
        get{
            return super.isHighlighted
        }
        
        set{
            //重写父类，作用：按住不显示灰暗色
        }
    }
}
