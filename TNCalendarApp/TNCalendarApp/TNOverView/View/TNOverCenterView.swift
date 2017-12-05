//
//  TNOverCenterView.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/5.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNOverCenterCellView: UIView {
    
    var numberlab: TNWhiteLabel!
    var tiplab: TNWhiteLabel!
    var tipView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        numberlab = TNWhiteLabel()
        numberlab.text = "36"
        numberlab.font = SFont(font: 95)
        numberlab.textAlignment = .center
        
        tiplab = TNWhiteLabel(gray: true)
        tiplab.text = "COMPLETED"
        tiplab.font = SFont(font: 20)
        tiplab.textAlignment = .center
        
        tipView = UIView()
        tipView.backgroundColor = .white
        
        addSubview(numberlab)
        addSubview(tiplab)
        addSubview(tipView)
        
        numberlab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.centerY).offset(20.toPixel())
        }
        
        tiplab.snp.makeConstraints { (make) in
            make.top.equalTo(numberlab.snp.bottom).offset(20.toPixel())
            make.centerX.equalTo(numberlab.snp.centerX)
        }
        
        tipView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 15.toPixel(), height: 15.toPixel()))
            make.top.equalTo(tiplab.snp.bottom).offset(20.toPixel())
            make.centerX.equalTo(numberlab.snp.centerX)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class TNOverCenterView: UIView {

    var completedView: TNOverCenterCellView!
    var overdueView: TNOverCenterCellView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tips = ["COMPLETED", "OVERDUE"]
        let colors = [UIColor.white, Hex("#bac8e1")]
        
        let cellWidth = SCREEN_WIDTH/2
        for (i, tip) in tips.enumerated() {
            let cell = TNOverCenterCellView(frame: CGRect(x: CGFloat(i)*cellWidth, y: 0, width: cellWidth, height: frame.size.height))
            cell.tiplab.text = tip
            cell.tipView.backgroundColor = colors[i]
            addSubview(cell)
            
            if i == 0 {
                completedView = cell
            }else
            {
                overdueView = cell
            }
        }
        
        completedView.extensionVerticalLine(position: .right)
        overdueView.extensionVerticalLine(position: .left)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
