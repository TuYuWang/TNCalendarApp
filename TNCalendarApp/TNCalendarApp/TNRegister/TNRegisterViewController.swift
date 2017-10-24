//
//  TNRegisterViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/20.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import RxSwift

class TNRegisterViewController: TNBaseViewController {

    var registerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SIGN UP"
        
        setupUI()
    }


    fileprivate func setupUI() {
        
        //tableview
        registerTableView = UITableView()
        registerTableView.bounces = false
        registerTableView.separatorStyle = .none
        registerTableView.backgroundColor = .clear
        registerTableView.rowHeight = 115.toPixel()
        registerTableView.register(TNRegisterViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(registerTableView)
        
        registerTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 130.toPixel(), 0))
        }
        
        //head view
        let headView = TNRegisterHeaderView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 442.toPixel()))
        registerTableView.tableHeaderView = headView
        
        let listSource = Observable.just([["NAME": "TuYuWang"],
                                          ["EMAIL": "18759280805@163.com"],
                                          ["PASSWORD": "tyw12345678"],
                                          ["GENDER": "Male"],
                                          ["BIRTHDAY": "1993.11.03"]])
        
        //list
        listSource.bind(to: registerTableView.rx.items(cellIdentifier: "cell", cellType: TNRegisterViewCell.self)){ (row, element, cell) in
            cell.keyLabel.text = element.keys.first
            cell.valueTextField.text = element.values.first
            if row != 0 { cell.extensionSeparatorLine(equalToSuperView: false) }
            
        }.disposed(by: disposeBag)
        
        
        //continue
        let continueBtn = UIButton(type: .custom)
        continueBtn.setTitle("CONTINUE", for: .normal)
        continueBtn.titleLabel?.font = SFont(font: 25)
        view.addSubview(continueBtn)
        
        continueBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(SCREEN_HEIGHT-130.toPixel(), 0, 0, 0))
        }
        
    }
}
