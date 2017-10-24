

//
//  TNRegisterHeaderView.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/24.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNRegisterHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        //line
        let line1 = TNLineView()
        addSubview(line1)
        
        line1.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(2.toPixel())
            make.height.equalTo(258.toPixel())
        }
        
        let line2 = TNLineView()
        addSubview(line2)
        
        line2.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(line1.snp.bottom)
            make.height.equalTo(2.toPixel())
        }
        
        let line3 = TNLineView()
        addSubview(line3)
        
        line3.snp.makeConstraints { (make) in
            make.top.equalTo(line2).offset(178.toPixel())
            make.height.equalTo(line2.snp.height)
            make.leading.trailing.equalToSuperview()
        }
        
        let imageNames = ["Icon-Twitter", "Icon-Facebook"]
        let titles = ["Connect with \nTwitter", "Connect with \nFacebook"]
        
        //connect
        for i in 0..<titles.count {
            let connectButton = TNButton(type: .top)
            connectButton.titleLabel?.font = SFont(font: 28)
            connectButton.titleLabel?.numberOfLines = 0
            connectButton.setTitle(titles[i], for: .normal)
            connectButton.setImage(ImageName(imageNames[i]), for: .normal)
            addSubview(connectButton)
            
            let leading = i == 0 ? 0 : (width/2-1.toPixel())
            
            connectButton.snp.makeConstraints({ (make) in
                make.top.equalTo(68.toPixel())
                make.leading.equalTo(leading)
                make.height.equalTo(260.toPixel())
                make.width.equalTo(width/2-1.toPixel())
            })
        }
        
        //email
        let emailButton = TNButton(type: .left)
        emailButton.titleLabel?.font = SFont(font: 28)
        emailButton.setTitle("or use your email address", for: .normal)
        emailButton.setImage(ImageName("Icon-Email"), for: .normal)
        addSubview(emailButton)
        
        emailButton.snp.makeConstraints { (make) in
            make.leading.equalTo(180.toPixel())
            make.bottom.equalTo(-2.toPixel())
            make.top.equalTo(260.toPixel())
        }
        
    }
}
