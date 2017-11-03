//
//  TNSettingsViewModel.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/27.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

struct SettingsModel {
    var header: String
    var items: [Item]
}

struct SettingsCellModel {
    var title: String
    var content: String
}

extension SettingsModel: SectionModelType {
    typealias Item = SettingsCellModel
    
    init(original: SettingsModel, items: [Item]) {
        self = original
        self.items = items
    }
}

class TNSettingsViewModel: NSObject {

    var model: Observable<[SettingsModel]>

    init(viewController: TNBaseViewController) {
        
        let userInfo = BmobUser.current()!
        
        self.model = Observable.just([SettingsModel(header: "GENERAL", items:
            [SettingsCellModel(title: "GENERAL", content: ""),
             SettingsCellModel(title: "NAME", content: userInfo.username),
             SettingsCellModel(title: "EMAIL", content: userInfo.email),
             SettingsCellModel(title: "PASSWORD", content: userInfo.password ?? ""),
             SettingsCellModel(title: "GENDER", content: userInfo.object(forKey: "gender") as! String),
             SettingsCellModel(title: "BIRTHDAY", content: userInfo.object(forKey: "birthday") as! String)
            ])])
        
    }
}


