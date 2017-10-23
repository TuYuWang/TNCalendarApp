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

    public var itemType: NavigationItemType = .system
    
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
        
        var imageName: String!
        
        let leftView = TNGrayButton(type: .custom)
        let leftItem = UIBarButtonItem(customView: leftView)
        let rightView = TNGrayButton(type: .custom)
        let rightItem = UIBarButtonItem(customView: rightView)
        
        
        switch itemType {
        case .system: break
        case .close:
            imageName = "icon-Close"
            
            leftView.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }).disposed(by: disposeBag)
            
            navigationItem.leftBarButtonItem = leftItem
            break
        case .menu:
            imageName = "Icon-Menu"
            
            navigationItem.leftBarButtonItem = leftItem
            break
        case .userImage:
            imageName = "Icon-Menu"
            
            navigationItem.rightBarButtonItem = rightItem
            break
        case .setting:
            imageName = "Icon-Settings"
            
            navigationItem.rightBarButtonItem = rightItem
            break
        case .switchOver:
            imageName = "Icon-Settings"

            navigationItem.rightBarButtonItem = rightItem
            break
        case .search:
            imageName = "icon-Search"

            navigationItem.rightBarButtonItem = rightItem
            break
        case .calendar:
            imageName = "Icon-Calendar"

            navigationItem.rightBarButtonItem = rightItem
            break
        case .list:
            imageName = "icon-Lists"

            navigationItem.rightBarButtonItem = rightItem
            break
        case .logout:
            imageName = "icon-Logout"

            navigationItem.rightBarButtonItem = rightItem
            break
        
        }
        leftView.setImage(ImageName(imageName), for: .normal)
        rightView.setImage(ImageName(imageName), for: .normal)

        leftView.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        rightView.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
}
