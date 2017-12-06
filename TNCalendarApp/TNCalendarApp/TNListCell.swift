//
//  TNListCell.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/6.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNListCell: UIView {

    var titlelab: TNWhiteLabel!
    var contentTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titlelab = TNWhiteLabel(gray: true)
        titlelab.text = "TITLE"
        titlelab.font = SFont(font: 24)
        
        contentTextField = UITextField()
        contentTextField.font = SFont(font: 28)
        contentTextField.text = "Weekly Stand Up"
        
        addSubview(titlelab)
        addSubview(contentTextField)
        
        titlelab.snp.makeConstraints { (make) in
            make.leading.equalTo(64.toPixel())
            make.centerY.equalToSuperview()
        }

        contentTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(283.toPixel())
            make.bottom.equalTo(titlelab.snp.bottom)
            make.trailing.equalTo(-59.toPixel())
        }
        
        extensionSeparatorLine(toView: self, equalToSuperView: false, topToSuperView: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
