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

    var registerViewController: TNRegisterViewController!
    var items: Observable<[[String: String]]>!

    init(viewController: TNRegisterViewController) {
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
                
                UIApplication.shared.keyWindow?.rootViewController = MPDTabBarViewController()
                return
            }
            
            //show error tip
            print(error!.localizedDescription)
        }
        
    }
}
