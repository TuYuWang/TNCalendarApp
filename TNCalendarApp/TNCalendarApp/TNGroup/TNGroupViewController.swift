//
//  TNGroupViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/8.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNGroupViewController: TNBaseViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setItemType(left: .menu, right: .search, menu: .pop)
        
        setContentViewBottomToSuper(offset: 0)
        
        title = "GROUPS"
        
        //tableView
        tableView = UITableView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64))
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = tableView.frame.height/3
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        
        tableView.register(TNGroupListCell.self, forCellReuseIdentifier: "cell")
    }


}

extension TNGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let titles = ["Music", "Travel", "Architecture", "Architecture"]
        let counts = ["15", "28", "36", "8"]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TNGroupListCell
        cell.backgroundImageView.image = ImageName(titles[indexPath.row])
        cell.titlelab.text = titles[indexPath.row]
        cell.itemsbtn.setTitle(counts[indexPath.row].appending(" ITEMS"), for: .normal)
        return cell
    }
    
}
