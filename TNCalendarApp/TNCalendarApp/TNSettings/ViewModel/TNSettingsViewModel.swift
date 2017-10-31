//
//  TNSettingsViewModel.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/27.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import RxSwift

class TNSettingsViewModel: TNRegisterViewModel {

    var sections: Observable<[String]>
    override init(viewController: TNBaseViewController) {
        self.sections = Observable.just(["GENERAL"])
        super.init(viewController: viewController)
    }
}
