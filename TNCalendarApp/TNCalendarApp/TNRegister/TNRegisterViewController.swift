//
//  TNRegisterViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/20.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TNRegisterViewController: TNBaseViewController {

    var registerTableView: UITableView!
    var registerViewModel: TNRegisterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SIGN UP"
        
        registerViewModel = TNRegisterViewModel(viewController: self)

        setupUI()
        
    }


    fileprivate func setupUI() {
        
        //continue
        let continueBtn = UIButton(type: .custom)
        continueBtn.setTitle("CONTINUE", for: .normal)
        continueBtn.setTitleColor(UIColor.gray, for: .disabled)
        continueBtn.titleLabel?.font = SFont(font: 25)
        view.addSubview(continueBtn)
        
        continueBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(SCREEN_HEIGHT-130.toPixel(), 0, 0, 0))
        }
        
        continueBtn.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.registerViewModel.nextStep()
            }).disposed(by: disposeBag)
        
        
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
        
        //list
        registerViewModel.items.bind(to: registerTableView.rx.items(cellIdentifier: "cell", cellType: TNRegisterViewCell.self)){ (row, element, cell) in
            
            cell.keyLabel.text = element.keys.first
            cell.valueTextField.text = element.values.first
            
            let allValid = cell.valueTextField.rx.text.orEmpty
                .map { $0.characters.count >= 4 }
                .share(replay: 1)
            
            allValid
                .bind(to: continueBtn.rx.isEnabled)
                .disposed(by: disposeBag)
            
            if row != 0 { cell.extensionSeparatorLine(equalToSuperView: false) }
            
        }.disposed(by: disposeBag)
        
        

    }
}
