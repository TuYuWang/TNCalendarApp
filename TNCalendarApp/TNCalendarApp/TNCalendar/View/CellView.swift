//
//  CellView.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/11/14.
//  Copyright © 2017年 com.person. All rights reserved.
//

import JTAppleCalendar

class CellView: JTAppleCell {
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var selectedView: UIView!
    var squareLine: CAShapeLayer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.toPixel()
        
        let squareWidth = SCREEN_WIDTH/7
        let X = squareWidth/2-35
        let Y = squareWidth/2-35
        
        squareLine = CAShapeLayer()
        squareLine.frame = CGRect(x: X, y: Y, width: squareWidth, height: squareWidth)
        squareLine.borderColor = UIColor.white.cgColor
        squareLine.borderWidth = 1
        layer.addSublayer(squareLine)
        
//        contentView.bounds = CGRect(x: 0, y: 0, width: SCREEN_WIDTH/7, height: SCREEN_WIDTH/7)
//        layer.borderColor
    }
    
    func set(current: Bool) {
        
        
    }
}
