//
//  TNListViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/13.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNListViewController: TNBaseViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setItemType(left: .menu, right: .search, menu: .pop)
        
        title = "LIST"
        
        //tableView
        tableView = UITableView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64-TABBAR_HEIGHT))
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = tableView.frame.height/8
        tableView.register(TNListTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        
        //add button
        let addBtn = TNGrayButton(type: .custom)
        addBtn.setImage(ImageName("Icon-Add"), for: .normal)
        view.addSubview(addBtn)
        addBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(SCREEN_HEIGHT-130.toPixel(), 0, 0, 0))
        }
        
        
    }

}

extension TNListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TNListTableViewCell
        cell.titlelab.text = "Paris"
        cell.checkImageView.image = ImageName("Icon-Check")
        cell.circleImageView.image = ImageName("Status")
        cell.checkImageView.alpha = indexPath.row%2 == 0 ? 0.4 : 1
        cell.extensionSeparatorLine(equalToSuperView: true)
        return cell
        
    }
}
