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
        squareLine = CAShapeLayer()
        squareLine.borderColor = UIColor.white.cgColor
        squareLine.borderWidth = 1
        squareLine.isHidden = true
        layer.addSublayer(squareLine)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let squareWidth = calendar_headHeight*1.2 - 1
        let X = (2*dayLabel.frame.midX-squareWidth)/2
        let Y = (2*dayLabel.frame.midY-squareWidth)/2
        
        squareLine.frame = CGRect(x: X, y: Y, width: squareWidth, height: squareWidth)
    }
    
    func set(current: Bool) {
        
        
    }
}
