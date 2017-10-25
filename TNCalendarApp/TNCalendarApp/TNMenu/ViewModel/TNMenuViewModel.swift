//
//  TNMenuViewModel.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/25.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import RxSwift

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
        
        menuViewController.dismiss(animated: true) {
            guard indexPath.row != 0, indexPath.row != 1, indexPath.row != 3 else {
                let tabBarController = UIApplication.shared.keyWindow?.rootViewController as! MPDTabBarViewController
                tabBarController.selectedIndex = indexPath.row
                
                
                return
            }
            print(indexPath.row)
        }
    }
    
    func logout() {
        
    }
}
