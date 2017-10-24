//
//  TNLineView.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/24.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNLineView: UIView {

    init() {
        super.init(frame: CGRect.zero)
        alpha = 0.2
        backgroundColor = Hex("#bac8e1")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
