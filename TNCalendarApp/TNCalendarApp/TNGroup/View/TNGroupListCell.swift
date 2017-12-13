//
//  TNGroupListCell.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/13.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNGroupListCell: UITableViewCell {

    var backgroundImageView: UIImageView!
    var titlelab: TNWhiteLabel!
    var itemsbtn: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        backgroundImageView = UIImageView()
        backgroundImageView.isUserInteractionEnabled = true
        
        titlelab = TNWhiteLabel()
        titlelab.font = SFont(font: 50)
        titlelab.textAlignment = .center
        
        itemsbtn = UIButton(type: .custom)
        itemsbtn.titleLabel?.font = SFont(font: 25)
        
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(titlelab)
        contentView.addSubview(itemsbtn)
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        titlelab.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY).offset(-40.toPixel())
            make.centerX.equalToSuperview()
        }
        
        itemsbtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(titlelab.snp.bottom).offset(50.toPixel())
            make.centerX.equalToSuperview()
            make.width.equalTo(180.toPixel())
            make.height.equalTo(70.toPixel())
        }
        
        itemsbtn.layer.borderColor = UIColor.white.cgColor
        itemsbtn.layer.borderWidth = 1.toPixel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
