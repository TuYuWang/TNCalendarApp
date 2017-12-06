//
//  TNAddTopView.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/6.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNAddTopView: UIView {

    var daylab: TNWhiteLabel!
    var weeklab: TNWhiteLabel!
    var yearlab: TNWhiteLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        daylab = TNWhiteLabel()
        daylab.font = SFont(font: 100)
        daylab.text = "12"
        
        weeklab = TNWhiteLabel()
        weeklab.font = SFont(font: 35)
        weeklab.text = "Thursday"
        
        yearlab = TNWhiteLabel(gray: true)
        yearlab.font = SFont(font: 20)
        yearlab.text = "MARCH 2015"
        
        addSubview(daylab)
        addSubview(weeklab)
        addSubview(yearlab)
        
        daylab.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(self.snp.centerX).offset(-20.toPixel())
            make.height.equalTo(80.toPixel())
        }
        
        weeklab.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.centerX)
            make.top.equalTo(daylab.snp.top)
        }
        
        yearlab.snp.makeConstraints { (make) in
            make.leading.equalTo(weeklab.snp.leading)
            make.bottom.equalTo(daylab.snp.bottom)
        }
        
        //image
        let left = UIImageView(image: ImageName("Icon-Chevron-Left"))
        let right = UIImageView(image: ImageName("Icon-Chevron-Right"))
        
        addSubview(left)
        addSubview(right)
        
        left.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(50.toPixel())
        }
        
        right.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(-50.toPixel())
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
