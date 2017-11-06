//
//  TNUserInfo.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/18.
//  Copyright © 2017年 com.person. All rights reserved.
//

struct TNUserInfo {
    
    var name: String
    var ID: String
    var password: String
    var headImagePath: String
    var email: String
    var gender: String
    var birthday: String
    
    init(user: BmobUser) {
        self.name = user.username
        self.ID = user.objectId
        self.headImagePath = ""
        self.email = user.email
        self.password = user.object(forKey: "psd") as! String
        self.gender = user.object(forKey: "gender") as! String
        self.birthday = user.object(forKey: "birthday") as! String
    }
    

}

struct Visitor {
    var name: String
    var password: String
    init() {
        name = "游客"
        password = "12345678"
    }
}

