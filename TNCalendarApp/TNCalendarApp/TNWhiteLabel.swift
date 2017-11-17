

//
//  TNWhiteLabel.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/18.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit


class TNWhiteLabel: UILabel {
    
    init() {
        super.init(frame: CGRect.zero)
        textColor = Hex("#ffffff")
    }
    
    init(gray: Bool) {
        super.init(frame: CGRect.zero)
        guard gray else { return }
        textColor = Hex("#bac8e1")
    }
    
    init(color: UIColor) {
        super.init(frame: CGRect.zero)
        textColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
