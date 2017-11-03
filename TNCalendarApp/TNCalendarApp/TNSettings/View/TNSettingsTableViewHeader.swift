//
//  TNSettingsTableViewHeader.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/11/2.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNSettingsTableViewHeader: UITableViewCell {

    var titleLabel: TNWhiteLabel!
    var indicatorImageView: UIImageView!
    
    
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
        
        //title label
        titleLabel = TNWhiteLabel(color: Hex("#CBDAEB"))
        titleLabel.font = SFont(font: 28)
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(62.toPixel())
        }
        
        //indicator image
        indicatorImageView = UIImageView(image: ImageName("icon-Disclosure"))
        contentView.addSubview(indicatorImageView)
        
        indicatorImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 44.toPixel(), height: 23.toPixel()))
            make.trailing.equalTo(-62.toPixel())
        }
    }
}
