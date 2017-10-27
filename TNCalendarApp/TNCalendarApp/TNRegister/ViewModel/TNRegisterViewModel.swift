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
                                 ["BIRTHDAY": ""]])
    }
    
    public func signUp(newUser: BmobUser) {
        
        newUser.signUpInBackground { (success, error) in
            guard !success else {
                
                guard UIApplication.shared.keyWindow?.rootViewController == TNLoginViewController.shared else {
                    self.registerViewController.dismiss(animated: false, completion: nil)
                    TNLoginViewController.shared.dismiss(animated: false, completion: nil)
                    return
                }
                UIApplication.shared.keyWindow?.rootViewController = MPDTabBarViewController()
                return
            }
            
            //show error tip
            print(error!.localizedDescription)
        }
        
    }
}
