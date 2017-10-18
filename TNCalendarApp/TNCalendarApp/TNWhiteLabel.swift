

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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
