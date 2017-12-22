//
//  TNTimeLineHeadView.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/15.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNTimeLineHeadView: UITableViewHeaderFooterView {

    var timeBtn: TNButton!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        backgroundView = UIView()
        backgroundView?.backgroundColor = .clear
        
        timeBtn = TNButton(type: .left)
        timeBtn.setImage(ImageName("Icon-Time"), for: .normal)
        timeBtn.setTitle("Thursday, March 12", for: .normal)
        timeBtn.setSpace(15)
        timeBtn.isUserInteractionEnabled = false
        timeBtn.titleLabel?.font = SFont(font: 20)
        timeBtn.titleLabel?.textColor = Hex("#bac8e1")
        
        addSubview(timeBtn)
        
        timeBtn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
