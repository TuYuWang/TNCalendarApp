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
    var headImageData: BmobFile
    var headImagePath: String
    var email: String
    var gender: String
    var birthday: String
    var info: BmobUser
 

    init(user: BmobUser) {
        self.info = user
        self.name = user.username
        self.ID = user.objectId
        self.headImagePath = user.separatedHeadImage()
        self.email = user.email
        self.password = user.get(key: "psd")
        self.gender = user.get(key: "gender")
        self.birthday = user.get(key: "birthday")
        self.headImageData = BmobFile(fileName: "userHead.png", withFileData: UIImagePNGRepresentation(ImageName("AvatarMask")!))

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

extension BmobUser {
    
    func separatedHeadImage() -> String {
        guard get(key: "headImage") != "" else {
            return ""
        }
        return (object(forKey: "headImage") as! BmobFile).url
    }
    
    func get(key: String) -> String {

        guard object(forKey: key) != nil else {
            return ""
        }
        return (object(forKey: key) as! String)
    }
}
