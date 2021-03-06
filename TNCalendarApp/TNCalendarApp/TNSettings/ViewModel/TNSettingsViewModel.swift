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
import RxCocoa
import PKHUD

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

// TODO: Blog
class TNSettingsViewModel {

    var model: Variable<[SettingsModel]>
    var userObservable: Variable<BmobUser>
 
    init(viewController: TNBaseViewController) {
        
        let userInfo = BmobUser.current()!

        let dataSource = TNSettingsViewModel.dataSource(user: userInfo)
        
        self.model = Variable(dataSource)

        self.userObservable = Variable(userInfo)

        self.userObservable.asObservable().subscribe({ (user) in
            self.model.value = TNSettingsViewModel.dataSource(user: user.element!)
        })
        .disposed(by: disposeBag)
        
    }
    
    func update() {
        self.userObservable.value = BmobUser.current()!
    }
    
    func update(background: TNUserInfo) {
        
        HUD.show(.systemActivity)

        background.info.updateInBackground { (success1, error1) in
            
            guard success1 else {
                HUD.flash(.labeledError(title: nil, subtitle: error1!.localizedDescription), delay: hudDelayTime)
                return
            }
            HUD.flash(.labeledSuccess(title: nil, subtitle: "Save Success"), delay: hudDelayTime)
        }
    }
    
    func update(headImage: TNUserInfo)  {
        
        HUD.show(.systemActivity)

        headImage.headImageData.save { (success2, error2) in
            
            guard success2 else {
                HUD.flash(.labeledError(title: nil, subtitle: error2!.localizedDescription), delay: hudDelayTime)
                print(error2.debugDescription)
                return
            }
            
            headImage.info.setObject(headImage.headImageData, forKey: "headImage")
            headImage.info.updateInBackground()
            HUD.flash(.labeledSuccess(title: nil, subtitle: "Save Success"), delay: hudDelayTime)
            
        }
    }
    
    fileprivate class func dataSource(user: BmobUser) -> [SettingsModel] {
        let dataSource =
            [SettingsModel(header: "GENERAL", items:
                [SettingsCellModel(title: "GENERAL", content: ""),
                 SettingsCellModel(title: "NAME", content: user.username),
                 SettingsCellModel(title: "EMAIL", content: user.email),
                 SettingsCellModel(title: "PASSWORD", content: user.object(forKey: "psd") as! String),
                 SettingsCellModel(title: "GENDER", content: user.object(forKey: "gender") as! String),
                 SettingsCellModel(title: "BIRTHDAY", content: user.object(forKey: "birthday") as! String)
            ])
//             SettingsModel(header: "SAVE", items:
//                [SettingsCellModel(title: "SAVE", content: ""),
//                 SettingsCellModel(title: "NAME", content: user.username),])
            ]
        return dataSource
    }
}

