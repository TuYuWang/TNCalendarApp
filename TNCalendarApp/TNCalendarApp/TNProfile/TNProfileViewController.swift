//
//  TNProfileViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/13.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNProfileViewController: TNBaseViewController {

    var headImageView: UIImageView!
    var centerView: TNProfileCenterView!
    var bottomView: TNProfileBottomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ByTun"
        
        setItemType(left: .menu, right: .setting, menu: .pop)
        setContentViewBottomToSuper(offset: 0)
        
        //top imageView
        headImageView = UIImageView(image: ImageName("AvatarMask"))
        headImageView.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 500.toPixel())
        view.addSubview(headImageView)
        
        //center view
        centerView = TNProfileCenterView(frame: CGRect(x: 0, y: headImageView.frame.maxY, width: SCREEN_WIDTH, height: 250.toPixel()))
        view.addSubview(centerView)
        centerView.extensionSeparatorLine(toView: centerView, equalToSuperView: true, topToSuperView: false)
        
        //bottom view
        bottomView = TNProfileBottomView(frame: CGRect(x: 0, y: centerView.frame.maxY, width: SCREEN_WIDTH, height: 330.toPixel()))
        view.addSubview(bottomView)
        bottomView.extensionSeparatorLine(toView: bottomView, equalToSuperView: true, topToSuperView: false)

    }
}
