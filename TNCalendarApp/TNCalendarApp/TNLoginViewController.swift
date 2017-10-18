//
//  TNLoginViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/18.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit

class TNLoginViewController: UIViewController {

    public var msgLabel: TNWhiteLabel!
    public var userHeaderImageView: UIImageView!
    public var menuTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        //init UI
        setupUI()
        
        //bind data to UI
        bind()
    }

    fileprivate func setupUI() {

        //backgroud image
        let backgroundImageView = UIImageView(image: ImageName("Background"))
        backgroundImageView.isUserInteractionEnabled = true
        self.view.addSubview(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        //logo image
        let logoImageView = UIImageView(image: ImageName("Logo"))
        backgroundImageView.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(160.toPixel())
            make.centerX.equalToSuperview()
        }
        
        //title
        msgLabel = TNWhiteLabel()
        msgLabel.text = "Welcome, Visitor!"
        msgLabel.font = SFont(font: 60)
        backgroundImageView.addSubview(msgLabel)
        
        msgLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).offset(68.toPixel())
            make.centerX.equalToSuperview()
        }
        
        //user background image
        let userBakcgroundImageView = UIImageView(image: ImageName("AvatarBorder"))
        backgroundImageView.addSubview(userBakcgroundImageView)
        
        userBakcgroundImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(msgLabel.snp.bottom).offset(242.toPixel())
            make.width.height.equalTo(220.toPixel())
        }
        
        //user header image
        userHeaderImageView = UIImageView(image: ImageName("Avatar"))
        userBakcgroundImageView.addSubview(userHeaderImageView)
        
        userHeaderImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(180.toPixel())
        }
        
        //tableView for sign in or new account
        menuTableView = UITableView()
        menuTableView.backgroundColor = .clear
        menuTableView.separatorStyle = .none
        menuTableView.rowHeight = 130.toPixel()
        menuTableView.register(TNLoginTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        backgroundImageView.addSubview(menuTableView)
        
        menuTableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(0)
            make.height.equalTo(260.toPixel())
        }
                

    }
    
    fileprivate func bind() {
        let viewModel = TNLoginViewModel(viewController: self)
    }
}




