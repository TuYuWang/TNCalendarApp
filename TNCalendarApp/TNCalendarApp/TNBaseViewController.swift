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
    private var contentBackgroundImageView: UIImageView!
    
    convenience init(type: NavigationItemType) {
        self.init()
        itemType = type
    }
    
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
        contentBackgroundImageView = UIImageView(image: ImageName("ContentBackground"))
        backgroundImageView.addSubview(contentBackgroundImageView)
        
        contentBackgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 130.toPixel(), right: 0))
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setItemType(type: itemType)
        
    }
    
    func setItemType(type: NavigationItemType) {
        
        var imageName: String!
        
        let leftView = TNGrayButton(type: .custom)
        let leftItem = UIBarButtonItem(customView: leftView)
        let rightView = TNGrayButton(type: .custom)
        let rightItem = UIBarButtonItem(customView: rightView)
        
        
        switch type {
        case .system: return
        case .close:
            imageName = "Icon-Close"
            
            leftView.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }).disposed(by: disposeBag)
            
            navigationItem.leftBarButtonItem = leftItem
            break
        case .menu:
            imageName = "Icon-Menu"
            
            leftView.rx.tap.subscribe(onNext: { [weak self] _ in
                
                guard let weakSelf = self else { return }
                
                if (weakSelf.containMenuViewController((weakSelf.navigationController?.viewControllers)!)) {
                    weakSelf.navigationController?.popViewController(animated: true)
                }else
                {
                    weakSelf.present(TNMenuViewController(type: .close).pushNavigationController(), animated: true, completion: nil)
                }
                
            }).disposed(by: disposeBag)
            
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
            imageName = "Icon-Search"
            
            navigationItem.rightBarButtonItem = rightItem
            break
        case .calendar:
            imageName = "Icon-Calendar"
            
            navigationItem.rightBarButtonItem = rightItem
            break
        case .list:
            imageName = "Icon-List"
            
            navigationItem.rightBarButtonItem = rightItem
            break
        case .logout:
            imageName = "Icon-Logout"

            rightView.rx.tap.subscribe(onNext: { [weak self] _ in
            
                self?.present(TNLoginViewController.shared, animated: true, completion: nil)

            }).disposed(by: disposeBag)
            
            navigationItem.rightBarButtonItem = rightItem
            break
            
        }
       
        leftView.setImage(ImageName(imageName), for: .normal)
        rightView.setImage(ImageName(imageName), for: .normal)
        
    }

    func pushNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    func setContentViewBottomToSuper() {
        contentBackgroundImageView.snp.updateConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func containMenuViewController(_ viewControllers: [UIViewController]) -> Bool {
        return  viewControllers.contains { $0.description.contains("TNMenuViewController") }
    }
}

