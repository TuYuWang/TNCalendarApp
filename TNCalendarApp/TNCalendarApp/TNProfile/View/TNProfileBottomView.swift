//
//  TNProfileBottomView.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/14.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNProfileBottomCell: UIView {
    
    var countslab: TNWhiteLabel!
    var tiplab: TNWhiteLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        countslab = TNWhiteLabel()
        countslab.font = SFont(font: 80)
        
        tiplab = TNWhiteLabel(gray: true)
        tiplab.font = SFont(font: 20)
        
        addSubview(countslab)
        addSubview(tiplab)
        
        countslab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20.toPixel())
        }
        
        tiplab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(countslab.snp.bottom).offset(20.toPixel())
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class TNProfileBottomView: UIView {

    var completedView: TNProfileBottomCell!
    var overdueView: TNProfileBottomCell!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        completedView = TNProfileBottomCell()
        completedView.countslab.text = "49"
        completedView.tiplab.text = "COMPLETED"
        
        overdueView = TNProfileBottomCell()
        overdueView.countslab.text = "8"
        overdueView.tiplab.text = "OVERDUE"
        
        addSubview(completedView)
        addSubview(overdueView)
        
        completedView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, SCREEN_WIDTH/2))
        }
        
        overdueView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, SCREEN_WIDTH/2, 0, 0))
        }
        
        extensionVerticalLine(position: .center)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
