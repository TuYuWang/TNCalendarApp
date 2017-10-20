//
//  TNLoginTableViewCell.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/18.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNLoginTableViewCell: UITableViewCell {

    public var contentLabel: TNWhiteLabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        extensionSeparatorLine(equalToSuperView: true)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        //content label
        contentLabel = TNWhiteLabel()
        contentLabel.font = SFont(font: 25)
        contentView.addSubview(contentLabel)
        
        contentLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        //tip image
        let tipImageView = UIImageView(image: ImageName("icon-Chevron-Right"))
        contentView.addSubview(tipImageView)
        
        tipImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(-49.toPixel())
            make.width.equalTo(23.toPixel())
            make.height.equalTo(42.toPixel())
        }
        
    }
}
