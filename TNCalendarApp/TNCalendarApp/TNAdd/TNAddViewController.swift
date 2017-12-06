//
//  TNAddViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/5.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNAddViewController: TNBaseViewController {

    var topView: TNAddTopView!
    var centerView: TNAddCenterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setItemType(left: .close)
        
        title = "ADD NEW"
        
        //top view
        topView = TNAddTopView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 300.toPixel()))
        view.addSubview(topView)
        topView.extensionSeparatorLine(toView: topView, topToSuperView: false)
        
        //center view
        centerView = TNAddCenterView(frame: CGRect(x: 0, y: topView.frame.maxY, width: SCREEN_WIDTH, height: 120.toPixel()))
        view.addSubview(centerView)
        centerView.extensionVerticalLine(position: .center)
        centerView.extensionSeparatorLine(toView: centerView, topToSuperView: false)
        
        let cellWidth = SCREEN_WIDTH
        let cellHeight = 120.toPixel()
        
        //title
        let titleCell = TNListCell(frame: CGRect(x: 0, y: centerView.frame.maxY+10.toPixel(), width: cellWidth, height: cellHeight))
        //where
        let whereCell = TNListCell(frame: CGRect(x: 0, y: titleCell.frame.maxY, width: cellWidth, height: cellHeight))
        //notify
        let notifyCell = TNListCell(frame: CGRect(x: 0, y: whereCell.frame.maxY, width: cellWidth, height: cellHeight))
        //people
        let peopleCell = TNListCell(frame: CGRect(x: 0, y: notifyCell.frame.maxY, width: cellWidth, height: cellHeight))
        //repeat
        let repeatCell = TNListCell(frame: CGRect(x: 0, y: peopleCell.frame.maxY, width: cellWidth, height: cellHeight))
        view.addSubview(titleCell)
        view.addSubview(whereCell)
        view.addSubview(notifyCell)
        view.addSubview(peopleCell)
        view.addSubview(repeatCell)
        
        
        //complete button
        let completeBtn = TNGrayButton(type: .custom)
        completeBtn.setImage(ImageName("DoneButton"), for: .normal)
        view.addSubview(completeBtn)
        completeBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(SCREEN_HEIGHT-130.toPixel(), 0, 0, 0))
        }
        
        completeBtn.rx.tap.subscribe(onNext: { _ in
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
    }

}
