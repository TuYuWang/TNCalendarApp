//
//  TNRegisterViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/20.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

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
        view.addSubview(registerTableView)
        
        registerTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 130.toPixel(), 0))
        }
        
        //head view
        let headView = UIView()
        headView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 230.toPixel())
        registerTableView.tableHeaderView = headView
        
        //list
        registerTableView.rx.items(cellIdentifier: "cell", cellType: <#T##Cell.Type#>)
        
        
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
