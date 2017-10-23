//
//  TNRegisterListCell.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/23.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNRegisterListCell: UITableViewCell {

    var keyLabel: TNWhiteLabel!
    var valueTextField: UITextField!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isFirstCell(right: Bool) {
        
        guard !right else { return }
        
        extensionSeparatorLine(equalToSuperView: false)
    }
    
    fileprivate func setupUI() {
        
        backgroundColor = .clear
        selectionStyle = .none
        
        //key
        keyLabel = TNWhiteLabel(gray: true)
        keyLabel.font = SFont(font: 20)
        keyLabel.text = "default"
        contentView.addSubview(keyLabel)
        
        keyLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(2.toPixel())
            make.leading.equalTo(62.toPixel())
        }
        
        //value
        valueTextField = UITextField()
        valueTextField.placeholder = "placeholder"
        valueTextField.font = SFont(font: 28)
        valueTextField.textColor = Hex("#ffffff")
        contentView.addSubview(valueTextField)
        
        valueTextField.snp.makeConstraints { (make) in
            make.centerY.equalTo(keyLabel)
            make.leading.equalTo(283.toPixel())
            make.trailing.equalTo(59.toPixel())
        }
    }

}
