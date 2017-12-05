//
//  TNOverTopView.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/5.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNOverTopView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let titles = ["Day", "Week", "Month"]
        let cellWidth = SCREEN_WIDTH/3
        
        for (i, title) in titles.enumerated() {
            let label = TNWhiteLabel()
            label.text = title
            label.font = SFont(font: 45)
            label.textAlignment = .center
            addSubview(label)
            label.frame = CGRect(x: CGFloat(i)*cellWidth, y: 0, width: cellWidth, height: frame.size.height)
        }
        
        //line
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
