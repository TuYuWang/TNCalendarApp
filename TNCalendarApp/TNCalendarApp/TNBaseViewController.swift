//
//  TNBaseViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/20.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import PKHUD

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
    
    enum menuEvent {
        case pop
        case present
    }
}

class TNBaseViewController: UIViewController {

    public var itemType: NavigationItemType = .system
    private var contentBackgroundImageView: UIImageView!
    
    convenience init(type: NavigationItemType = .system) {
        self.init()
        setItemType(left: type)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setItemType(left: itemType)

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

    }
    
    func setItemType(left: NavigationItemType, right: NavigationItemType = .system, menu: NavigationItemType.menuEvent = .pop) {
        
        var rightImageName: String!
        var leftImageName: String!

        let leftView = TNGrayButton(type: .custom)
        let leftItem = UIBarButtonItem(customView: leftView)
        let rightView = TNGrayButton(type: .custom)
        let rightItem = UIBarButtonItem(customView: rightView)
        
        switch left {
        case .system: return
        case .userImage: return
        case .setting: return
        case .switchOver: return
        case .search: return
        case .calendar: return
        case .list: return
        case .logout: return
        case .close:
            leftImageName = "Icon-Close"
            
            leftView.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }).disposed(by: disposeBag)
            
            break
        case .menu:
            leftImageName = "Icon-Menu"
            
            leftView.rx.tap.subscribe(onNext: { [weak self] _ in
                
                guard let weakSelf = self else { return }
                
                switch menu {
                case .pop:
                    weakSelf.pop()
                    break
                case .present:
                    weakSelf.present(TNMenuViewController(type: .close).pushNavigationController(), animated: true, completion: nil)
                    break
                }
            }).disposed(by: disposeBag)
            
            break
            
        }
        
        navigationItem.leftBarButtonItem = leftItem
        leftView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        leftView.setImage(ImageName(leftImageName), for: .normal)

        
        switch right {
        case .system: return
        case .close: return
        case .menu: return
        case .userImage:
            rightImageName = "Icon-Menu"
            
            break
        case .setting:
            rightImageName = "Icon-Settings"
            rightView.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.push(viewController: TNSettingsViewController())
            }).disposed(by: disposeBag)
            
            break
        case .switchOver:
            rightImageName = "Icon-Settings"
            
            break
        case .search:
            rightImageName = "Icon-Search"
            
            break
        case .calendar:
            rightImageName = "Icon-Calendar"
            
            rightView.rx.tap.subscribe(onNext: { [weak self] _ in
                UIApplication.rootViewController().selectedIndex = 0
                self?.dismiss(animated: true, completion: nil)
            }).disposed(by: disposeBag)


            break
        case .list:
            rightImageName = "Icon-List"
            
            break
        case .logout:
            rightImageName = "Icon-Logout"
            
            rightView.rx.tap.subscribe(onNext: { [weak self] _ in
                
                BmobUser.logout()
                
                HUD.flash(.labeledSuccess(title: nil, subtitle: "Logout Sucess"), onView: nil, delay: hudDelayTime, completion: { (complete) in
                    self?.present(TNLoginViewController.shared, animated: true, completion: nil)
                })
                
            }).disposed(by: disposeBag)
            
            break
        }
        
        navigationItem.rightBarButtonItem = rightItem
        rightView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        rightView.setImage(ImageName(rightImageName), for: .normal)

    }


    
}

extension TNBaseViewController {
    
    func pushNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    func setContentViewBottomToSuper(offset: CGFloat) {
        contentBackgroundImageView.snp.updateConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: min(abs(offset*widthFor750), 130.toPixel()), right: 0))
        }
    }
    
    func containMenuViewController(_ viewControllers: [UIViewController]) -> Bool {
        return viewControllers.contains { $0.description.contains("TNMenuViewController")}
    }
    
    func push(viewController: TNBaseViewController) {
        assert(navigationController != nil, "navigationController not be nil!")
        UIApplication.rootViewController().tabBarView.isHidden = true
        navigationController!.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        UIApplication.rootViewController().tabBarView.isHidden = false
        navigationController?.popViewController(animated: true)
    }
}
