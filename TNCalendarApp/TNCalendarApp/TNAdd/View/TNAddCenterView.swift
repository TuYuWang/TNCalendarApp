//
//  TNAddCenterView.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/6.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNAddCenterView: UIView {

    var startBtn: UIButton!
    var endBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        startBtn = UIButton(type: .custom)
        startBtn.setTitle("2:00 PM", for: .normal)
        
        endBtn = UIButton(type: .custom)
        endBtn.setTitle("- -", for: .normal)
        
        addSubview(startBtn)
        addSubview(endBtn)
        
        startBtn.snp.makeConstraints { (make) in
           make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, SCREEN_WIDTH/2))
        }
        
        endBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, SCREEN_WIDTH/2, 0, 0))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
