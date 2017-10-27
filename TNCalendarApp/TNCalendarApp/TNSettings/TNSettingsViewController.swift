//
//  TNSettingsViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/26.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import RxSwift


class TNSettingsViewController: TNBaseViewController {

    var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SETTINGS"
        
        setContentViewBottomToSuper()
        
        setupUI()
    }

    fileprivate func setupUI() {
        
        let settingsViewModel = TNSettingsViewModel(viewController: self)
        
        //head image background
        let headBackgroundImageView = UIImageView(image: ImageName("AvatarMask"))
        headBackgroundImageView.frame = CGRect(x: 0, y: -500.toPixel(), width: SCREEN_WIDTH, height: 500.toPixel())
        headBackgroundImageView.contentMode = .scaleAspectFill
        headBackgroundImageView.layer.masksToBounds = true
        
        //settings tableView
        settingsTableView = UITableView()
        settingsTableView.backgroundColor = .clear
        settingsTableView.separatorStyle = .none
        settingsTableView.rowHeight = 115.toPixel()
        settingsTableView.contentInset = UIEdgeInsetsMake(500.toPixel(), 0, 0, 0)
        settingsTableView.register(TNSettingsTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(settingsTableView)
        
        settingsTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        settingsTableView.addSubview(headBackgroundImageView)
       
        
        settingsViewModel.items.bind(to: settingsTableView.rx.items(cellIdentifier: "cell", cellType: TNSettingsTableViewCell.self)){ (row, element, cell) in
            cell.keyLabel.text = element.keys.first
            cell.valueTextField.text = element.values.first
            
            }.disposed(by: disposeBag)
        
        settingsTableView.rx.contentOffset.subscribe(onNext: { (point) in
            var headViewFrame = headBackgroundImageView.frame
            let offsetY = 314.toPixel() + Int(point.y).toPixel()
//            headViewFrame.size.height = offsetY
//            if -offsetY < 500.toPixel() {
//                headViewFrame.size.height = 500.toPixel()
//            }
            headViewFrame.size.height = 500.toPixel() - offsetY
            headBackgroundImageView.frame = headViewFrame

        }).disposed(by: disposeBag)
    }

}
