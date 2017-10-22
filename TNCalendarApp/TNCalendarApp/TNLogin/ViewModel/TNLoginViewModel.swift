//
//  TNLoginViewModel.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/18.
//  Copyright © 2017年 com.person. All rights reserved.
//

import RxSwift
import RxDataSources

class TNLoginViewModel: NSObject {
    
    var isLogin: Bool?
    var userHeadImage: UIImage?
    var userName: String?
    var password: String?
    var items: Observable<[String]>!
    
    var loginviewController: TNLoginViewController!
    
    
    init(viewController: TNLoginViewController) {
        
        super.init()
        
        loginviewController = viewController
        items = Observable.just(["SIGN IN", "NEW ACCOUNT"])
        
        //get userInfo from disk
        
        //get default info
        
        
    }
    
    public func SignIn() {
    
        //request
        BmobUser.loginWithUsername(inBackground: Visitor().name, password: Visitor().password) { (userInfo, error) in
            guard error == nil else {
                
                //show tip
                print(error?.localizedDescription)
                return
            }
            print(userInfo)
            UIApplication.shared.keyWindow?.rootViewController = MPDTabBarViewController()
        }
    }
    
    public func NewAccount() {
        let registerViewController = TNRegisterViewController()
        registerViewController.itemType = .close
        loginviewController.present(UINavigationController(rootViewController: registerViewController), animated: true, completion: nil)
    }
    
}
