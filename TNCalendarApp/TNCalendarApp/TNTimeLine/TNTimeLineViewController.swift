//
//  TNTimeLineViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/15.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNTimeLineViewController: TNBaseViewController {

    var titlelab: TNWhiteLabel!
    var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setItemType(left: .menu, right: .filter, menu: .pop)
        setContentViewBottomToSuper(offset: 0)
        
        title = "TIMELINE"
        
        //title lab
        titlelab = TNWhiteLabel()
        titlelab.font = SFont(font: 60)
        titlelab.text = "March"
        view.addSubview(titlelab)
        titlelab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(180.toPixel())
        }
        
        //tableView
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 200.toPixel()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TNTimeLineCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TNTimeLineHeadView.self, forHeaderFooterViewReuseIdentifier: "head")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(titlelab.snp.bottom).offset(50.toPixel())
            make.leading.trailing.bottom.equalTo(0)
        }
    }

}

extension TNTimeLineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120.toPixel()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TNTimeLineCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "head")
        return sectionView
    }

}
