//
//  TNTimeLineCell.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/15.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNTimeLineCell: UITableViewCell {

    var eventlab: TNWhiteLabel!
    var addresslab: TNWhiteLabel!
    var detaillab: TNWhiteLabel!
    var timelab: TNWhiteLabel!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        eventlab = TNWhiteLabel()
        eventlab.font = SFont(font: 30)
        eventlab.text = "Weekly Stand Up"
        
        addresslab = TNWhiteLabel()
        addresslab.font = SFont(font: 25)
        addresslab.text = "Hangouts"
        
        detaillab = TNWhiteLabel(gray: true)
        detaillab.font = SFont(font: 25)
        detaillab.text = "Web App"
        
        timelab = TNWhiteLabel()
        timelab.font = SFont(font: 40)
        timelab.text = "8:00 AM"
        
        let line = UIView()
        line.backgroundColor = Hex("#bac8e1")
        
        contentView.addSubview(eventlab)
        contentView.addSubview(addresslab)
        contentView.addSubview(detaillab)
        contentView.addSubview(timelab)
        contentView.addSubview(line)

        eventlab.snp.makeConstraints { (make) in
            make.leading.equalTo(62.toPixel())
            make.top.equalTo(50.toPixel())
            make.trailing.lessThanOrEqualTo(contentView.snp.centerX)
        }
        
        addresslab.snp.makeConstraints { (make) in
            make.leading.equalTo(eventlab.snp.leading)
            make.top.equalTo(eventlab.snp.bottom)
            make.trailing.equalTo(eventlab.snp.trailing)
        }
        
        detaillab.snp.makeConstraints { (make) in
            make.leading.equalTo(eventlab.snp.leading)
            make.top.equalTo(addresslab.snp.bottom)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom)
            make.trailing.equalTo(eventlab.snp.trailing)
        }
        
        timelab.snp.makeConstraints { (make) in
            make.trailing.equalTo(-62.toPixel())
            make.centerY.equalToSuperview()
        }
        
        line.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(2.toPixel())
            make.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
