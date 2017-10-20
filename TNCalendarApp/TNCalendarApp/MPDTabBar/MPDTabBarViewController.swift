//
//  MPDTabBarViewController.swift
//  MPD
//
//  Created by 涂育旺 on 2017/6/12.
//  Copyright © 2017年 Qianhai Jiutong. All rights reserved.
//

import UIKit

class MPDTabBarViewController: UITabBarController {

    lazy var tabBarView: MPDTabBarView = {
        let view = MPDTabBarView.init(frame: CGRect(x: 0, y: SCREEN_HEIGHT-TABBAR_HEIGHT, width: SCREEN_WIDTH, height: TABBAR_HEIGHT))
        view.delegate = self as MPDTabBarViewViewDelegate
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(self.tabBarView)
        tabBar.isHidden = true
        
        let homeNavigationController = createNavigationController(controllerName: "TNCalendarViewController")
        let loanNavigationController = createNavigationController(controllerName: "TNHomeViewController")
        let mineNavigationController = createNavigationController(controllerName: "TNOverViewController")

        viewControllers = [homeNavigationController, loanNavigationController, mineNavigationController]
        selectedIndex = defaultTabbarSelected
    }
    
    func createNavigationController(controllerName: String) -> UINavigationController{
    
        let viewController = NSClassFromString("TNCalendarApp." + controllerName) as! UIViewController.Type
        
        let controller = viewController.init()
                
        return UINavigationController(rootViewController: controller)
    
    }
}

extension MPDTabBarViewController: MPDTabBarViewViewDelegate {

    func MPDTabBar(tabBar: MPDTabBarButton, index: Int) {
        self.selectedIndex = index
    }
}


