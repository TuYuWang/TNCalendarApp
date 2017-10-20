//
//  TNBaseViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/20.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

enum NavigationItemType {
    case system
    case close
    case menu
    case userImage
    case setting
    case switchOver
    case search
    case calendar
    case list
    case logout
}

class TNBaseViewController: UIViewController {

    var itemType: NavigationItemType = .system
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        //background image
        let backgroundImageView = UIImageView(image: ImageName("BaseBackground"))
        view.addSubview(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        //background content image
        let contentBackgroundImageView = UIImageView(image: ImageName("ContentBackground"))
        backgroundImageView.addSubview(contentBackgroundImageView)
        
        contentBackgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 130.toPixel(), right: 0))
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        switch itemType {
        case .system: break
        case .close:
            break
        case .menu:
            break
        case .userImage:
            break
        case .setting:
            break
        case .switchOver:
            break
        case .search:
            break
        case .calendar:
            break
        case .list:
            break
        case .logout:
            break
        
        }
    }
}
