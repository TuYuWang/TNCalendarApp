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
        items = Observable.just([["NAME": "TuYuWang"],
                                 ["EMAIL": "18759280805@163.com"],
                                 ["PASSWORD": "tyw12345678"],
                                 ["GENDER": "Male"],
                                 ["BIRTHDAY": "1993.11.03"]])
    }
    
    public func nextStep() {
        let newUser = BmobUser()
        newUser.signUpInBackground { (success, error) in
            guard success else { return }
            
            //show error tip
        }
        
    }
}
