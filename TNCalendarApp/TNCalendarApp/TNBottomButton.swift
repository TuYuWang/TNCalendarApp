//
//  TNBottomButton.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/11/7.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

enum BottomButtonSuperviewType {
    case rootView
    case tableView
}

class TNBottomButton: UIButton {

    var title: String? {
        willSet {
         setTitle(title, for: .normal)
        }
    }
    
    var image: UIImage? {
        willSet {
            setImage(image, for: .normal)
        }
    }
    
    private var superviewType: BottomButtonSuperviewType!
    convenience init(type: BottomButtonSuperviewType) {
        self.init(type: .custom)
        superviewType = type
        alpha = 0
        backgroundColor = .clear
        setTitleColor(UIColor.gray, for: .disabled)
        titleLabel?.font = SFont(font: 25)
    }


//    override func didMoveToSuperview() {
//        super.didMoveToSuperview()
//        snp.makeConstraints { (make) in
//            make.edges.equalTo(bottomButtonEdges)
//        }
//        
//    }
    
}
