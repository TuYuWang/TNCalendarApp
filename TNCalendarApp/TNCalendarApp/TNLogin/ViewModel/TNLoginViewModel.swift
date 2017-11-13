//
//  TNLoginViewModel.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/18.
//  Copyright © 2017年 com.person. All rights reserved.
//

import RxSwift
import RxDataSources
import PKHUD

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
    
        let defaultUser = BmobUser()
        defaultUser.username = "Test29"
        defaultUser.password = "12345678"
        defaultUser.setObject("12345678", forKey: "psd")
 
        var name = defaultUser.username
        var password = defaultUser.password
        
        if let user = BmobUser.current() {
            name = user.username
            password = user.object(forKey: "psd") as? String
        }
        
        //request
        HUD.show(.systemActivity)
        BmobUser.loginWithUsername(inBackground: name, password: password) { (userInfo, error) in
            guard error == nil else {
                
                //show tip
                HUD.flash(.labeledError(title: nil, subtitle: error?.localizedDescription), onView: nil, delay: hudDelayTime, completion: nil)
                return
            }
            
            //success
            BmobUser.current().setObject(password, forKey: "psd")
            print(BmobUser.current())
            HUD.flash(.label("Login Sucess"), onView: nil, delay: hudDelayTime, completion: { (complete) in
                
                guard UIApplication.shared.keyWindow?.rootViewController == TNLoginViewController.shared else {
                    TNLoginViewController.shared.dismiss(animated: true, completion: nil)
                    return
                }
                UIApplication.shared.keyWindow?.rootViewController = MPDTabBarViewController()
            })

        }
    }
    
    public func NewAccount() {
        let registerViewController = TNRegisterViewController(type: .close)
        loginviewController.present(registerViewController.pushNavigationController(), animated: true, completion: nil)
    }
    
}
