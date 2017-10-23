//
//  TNRegisterConnectCell.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/23.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNRegisterConnectCell: UITableViewCell {

    var twitterButton: TNButton!
    var facebookButton: TNButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupUI() {
       
        backgroundColor = .clear
        
        //connect with Twitter
        twitterButton = TNButton(type: .top)
        twitterButton.titleLabel?.font = SFont(font: 28)
        twitterButton.titleLabel?.textColor = Hex("#ffffff")
        twitterButton.backgroundColor = .clear
        twitterButton.titleLabel?.numberOfLines = 0
        contentView.addSubview(twitterButton)
        
        twitterButton.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalTo(width/2-1.toPixel())
            make.leading.top.equalToSuperview()
        }
        
        //connect with Fackbook
        facebookButton = TNButton(type: .top)
        facebookButton.titleLabel?.font = SFont(font: 28)
        facebookButton.titleLabel?.textColor = Hex("#ffffff")
        facebookButton.titleLabel?.numberOfLines = 0
        facebookButton.backgroundColor = .clear
        contentView.addSubview(facebookButton)
        
        facebookButton.snp.makeConstraints { (make) in
            make.width.equalTo(twitterButton.snp.width)
            make.trailing.top.equalToSuperview()
            make.height.equalToSuperview()
        }
        
//        twitterButton.setImage(ImageName("Icon-Twitter"), for: .normal)
//        twitterButton.setTitle("Connect with Twitter", for: .normal)
//        facebookButton.setImage(ImageName("Icon-Facebook"), for: .normal)
//        facebookButton.setTitle("Connect with Facebook", for: .normal)
    }
}
