//
//  TNMenuViewModel.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/25.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import RxSwift

enum MenuSelectedItem: Int{
    
    case home
    case calendar
    case groups
    case overview
    case list
    case profile
    case timeline
    case settings

}

class TNMenuViewModel: NSObject {
    var items: Observable<[String]>!
    var menuViewController: TNMenuViewController!
    
    init(viewController: TNMenuViewController) {
        items = Observable.just(["Home",
                                 "Calendar",
                                 "Groups",
                                 "Overview",
                                 "List",
                                 "Profile",
                                 "Timeline",
                                 "Settings"])
        menuViewController = viewController
    }
    
    func selectedItem(indexPath: IndexPath) {
        
            switch MenuSelectedItem(rawValue: indexPath.row){

            case .some(.home):
                dismiss(index: defaultTabbarSelected)
                break
            case .some(.calendar):
                dismiss(index: 0)
                break
            case .some(.groups):
                menuViewController.navigationController?.pushViewController(TNGroupViewController(), animated: true)
                break
            case .some(.overview):
                dismiss(index: 2)
                break
            case .some(.list):
                menuViewController.navigationController?.pushViewController(TNListViewController(), animated: true)
                break
            case .some(.profile):
                menuViewController.navigationController?.pushViewController(TNProfileViewController(), animated: true)
                break
            case .some(.timeline):
                break
            case .some(.settings):
                push(viewController: TNSettingsViewController())
                break
            case .none:
                return
            }
        }
    
    func logout() {
        
    }
    
    fileprivate func dismiss(index: Int) {
        UIApplication.rootViewController().selectedIndex = index
        menuViewController.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func push(viewController: TNBaseViewController)
    {
        viewController.setItemType(left: .menu, right: .logout)
        menuViewController.navigationController?.pushViewController(viewController, animated: true)
    }
}
    


