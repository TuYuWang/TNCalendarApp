//
//  TNProfileCenterView.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/14.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNProfileCenterView: UIView {

    var titlelab: TNWhiteLabel!
    var detaillab: TNWhiteLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        titlelab = TNWhiteLabel()
        titlelab.text = "February"
        titlelab.font = SFont(font: 45)
        
        detaillab = TNWhiteLabel(gray: true)
        detaillab.text = "Good job! 9% more completed tasks this moth."
        detaillab.font = SFont(font: 25)
        detaillab.textAlignment = .center
        detaillab.numberOfLines = 0
        
        //image
        let left = UIImageView(image: ImageName("Icon-Chevron-Left"))
        let right = UIImageView(image: ImageName("Icon-Chevron-Right"))
        
        addSubview(titlelab)
        addSubview(detaillab)
        addSubview(left)
        addSubview(right)
        
        titlelab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(50.toPixel())
        }
        
        detaillab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(titlelab.snp.bottom).offset(50.toPixel())
            make.width.equalTo(500.toPixel())
        }
        
        left.snp.makeConstraints { (make) in
            make.centerY.equalTo(titlelab.snp.centerY)
            make.leading.equalTo(50.toPixel())
        }
        
        right.snp.makeConstraints { (make) in
            make.centerY.equalTo(titlelab.snp.centerY)
            make.trailing.equalTo(-50.toPixel())
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
