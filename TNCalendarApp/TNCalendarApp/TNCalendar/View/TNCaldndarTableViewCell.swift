//
//  TNCaldndarTableViewCell.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/11/22.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNCaldndarTableViewCell: UITableViewCell {

    var titlelab: TNWhiteLabel!
    var wherelab: TNWhiteLabel!
    var timelab:  TNWhiteLabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //title
        titlelab = TNWhiteLabel()
        contentView.addSubview(titlelab)
        
        //where
        wherelab = TNWhiteLabel(gray: true)
        contentView.addSubview(wherelab)
        
        //time
        timelab = TNWhiteLabel()
        contentView.addSubview(timelab)
        
        //constranint
        titlelab.snp.makeConstraints { (make) in
            make.leading.equalTo(62.toPixel())
            make.centerY.equalToSuperview()
        }
        
        wherelab.snp.makeConstraints { (make) in
            make.leading.equalTo(titlelab.snp.leading)
            make.top.equalTo(titlelab.snp.bottom)
        }
        
        timelab.snp.makeConstraints { (make) in
            make.trailing.equalTo(-62.toPixel())
            make.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
