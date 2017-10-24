//
//  TNRegisterViewCell.swift
//  TNCalendarApp
//
//  Created by Mac on 2017/10/21.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNRegisterViewCell: UITableViewCell {

    var keyLabel: TNWhiteLabel!
    var valueTextField: UITextField!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        backgroundColor = .clear
        selectionStyle = .none
        
        //key
        keyLabel = TNWhiteLabel(gray: true)
        keyLabel.font = SFont(font: 24)
        contentView.addSubview(keyLabel)
        
        keyLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(62.toPixel())
            make.centerY.equalToSuperview().offset(1.toPixel())
        }
        
        //value
        valueTextField = UITextField()
        valueTextField.textColor = .white
        valueTextField.font = SFont(font: 28)
        contentView.addSubview(valueTextField)
        
        valueTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(283.toPixel())
            make.bottom.equalTo(keyLabel.snp.bottom)
            make.trailing.equalTo(-59.toPixel())
        }
        
    }
}
