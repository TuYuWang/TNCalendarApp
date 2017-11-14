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

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
