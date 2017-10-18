//
//  TNLoginViewModel.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/18.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNLoginViewModel: NSObject {
    
    var isLogin: Bool?
    var userHeadImage: UIImage?
    var userName: String?
    var password: String?
    var loginviewController: TNLoginViewController!
    
    
    init(viewController: TNLoginViewController) {
        
        super.init()
        loginviewController = viewController
        
        //get userInfo from disk
        
        //get default info
        
        let response = loginviewController.menuTableView.rx.itemSelected
        response.subscribe { (indexPath) in
            print(indexPath)
        }.dispose()
        
    }
    
    public func start() {
    
        //request
        BmobUser.loginWithUsername(inBackground: Visitor().name, password: Visitor().password) { (userInfo, error) in
            guard error != nil else {
                
                //show tip
                
                return
            }
            
            
        }
    }
    
}
