//
//  TNRegisterViewModel.swift
//  TNCalendarApp
//
//  Created by Mac on 2017/10/21.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import RxSwift
import PKHUD

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
        
        HUD.show(.systemActivity)
        newUser.signUpInBackground { (success, error) in
            guard !success else {
                                
                //show sing up sucess
                
                HUD.flash(.label("register success"), onView: nil, delay: hudDelayTime, completion: { (complete) in
                    //dismiss self
                    self.registerViewController.dismiss(animated: false, completion: nil)
                })
                
                return
            }
            
            //show error tip
            print(error!.localizedDescription)
            HUD.flash(.labeledSuccess(title: nil, subtitle: error!.localizedDescription), delay: hudDelayTime)
        }
        
    }
}
