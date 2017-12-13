//
//  TNListTableViewCell.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/13.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNListTableViewCell: UITableViewCell {

    var checkImageView: UIImageView!
    var circleImageView: UIImageView!
    var titlelab: TNWhiteLabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        checkImageView = UIImageView()
        
        titlelab = TNWhiteLabel()
        titlelab.font = SFont(font: 30)
        
        circleImageView = UIImageView()
        
        contentView.addSubview(checkImageView)
        contentView.addSubview(titlelab)
        contentView.addSubview(circleImageView)
        
        checkImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(62.toPixel())
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        titlelab.snp.makeConstraints { (make) in
            make.left.equalTo(checkImageView.snp.right).offset(25.toPixel())
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        circleImageView.snp.makeConstraints { (make) in
            make.trailing.equalTo(-62.toPixel())
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
