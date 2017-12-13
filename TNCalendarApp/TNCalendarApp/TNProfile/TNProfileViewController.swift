//
//  TNProfileViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/13.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNProfileViewController: TNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ByTun"
        
        setItemType(left: .menu, right: .setting, menu: .pop)
    }
}
