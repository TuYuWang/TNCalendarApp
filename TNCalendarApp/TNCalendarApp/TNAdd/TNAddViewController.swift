//
//  TNAddViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/12/5.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNAddViewController: TNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setItemType(left: .menu, right: .calendar, menu: .present)
    }

}
