//
//  TNRegisterViewModel.swift
//  TNCalendarApp
//
//  Created by Mac on 2017/10/21.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import RxSwift

class TNRegisterViewModel: NSObject {

    var registerViewController: TNBaseViewController!
    var items: Observable<[[String: String]]>!

    init(viewController: TNBaseViewController) {
        registerViewController = viewController
        items = Observable.just([["NAME": ""],
                                 ["EMAIL": ""],
                                 ["PASSWORD": ""],
                                 ["GENDER": ""],
                                 ["BIRTHDAY": ""],
                                 ])
    }
    
    public func signUp(newUser: BmobUser) {
        
        newUser.signUpInBackground { (success, error) in
            guard !success else {
                
                newUser.setObject(newUser.password, forKey: "password")
                BmobUser.loginWithUsername(inBackground: newUser.username, password: newUser.password)
                
                var root = UIApplication.shared.keyWindow?.rootViewController

                guard root == TNLoginViewController.shared else {
                        
                    self.registerViewController.dismiss(animated: false, completion: nil)
                    TNLoginViewController.shared.dismiss(animated: false, completion: nil)
                    return
                }
                root = MPDTabBarViewController()
                print(BmobUser.current())
                return
            }
            
            //show error tip
            print(error!.localizedDescription)
        }
        
    }
}

