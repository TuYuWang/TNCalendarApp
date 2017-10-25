//
//  TNMenuCollectionViewCell.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/25.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNMenuCollectionViewCell: UICollectionViewCell {
    
    var listButton: TNButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        backgroundColor = .clear
        
        //TNButton
        listButton = TNButton(type: .top)
        listButton.titleLabel?.font = SFont(font: 28)
        listButton.isEnabled = false
        listButton.setSpace(31)
        listButton.setImageSize(CGSize(width: 45.toPixel(), height: 45.toPixel()))
        contentView.addSubview(listButton)
        
        listButton.snp.makeConstraints { (make) in
            make.top.equalTo(83.toPixel())
            make.centerX.equalToSuperview()
        }
        
    }
}
