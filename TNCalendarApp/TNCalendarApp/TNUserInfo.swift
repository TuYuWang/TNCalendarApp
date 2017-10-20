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
    
//    func Visitor() -> TNUserInfo {
//        return TNUserInfo.init(name: "游客", ID: "RLw7jjju", password: "123456789", headImagePath: "")
//    }
    enum Visitor {
        case name
        case password
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

