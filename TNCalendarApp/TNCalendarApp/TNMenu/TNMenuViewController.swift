//
//  TNMenuViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/25.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TNMenuViewController: TNBaseViewController {

    var menuCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Navigate"
        
        setupUI()
    }

    fileprivate func setupUI () {
        
        let menuViewModel = TNMenuViewModel(viewController: self)

        //logout
        let logoutButton = UIButton(type: .custom)
        logoutButton.setTitle("LOGOUT", for: .normal)
        logoutButton.setTitleColor(UIColor.gray, for: .disabled)
        logoutButton.titleLabel?.font = SFont(font: 25)
        view.addSubview(logoutButton)
        
        logoutButton.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(SCREEN_HEIGHT-130.toPixel(), 0, 0, 0))
        }
        
        //menu list
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: SCREEN_WIDTH/2, height: 268.toPixel())
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        menuCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        menuCollectionView.bounces = false
        menuCollectionView.backgroundColor = .clear
        menuCollectionView.register(TNMenuCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(menuCollectionView)
    
        menuCollectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 130.toPixel(), 0))
        }
        
        menuViewModel.items.bind(to: menuCollectionView.rx.items(cellIdentifier: "cell", cellType: TNMenuCollectionViewCell.self)) { (row, element, cell) in
            
            cell.listButton.setImage(ImageName("Icon-\(element)"), for: .normal)
            cell.listButton.setTitle(element, for: .normal)
            cell.extensionVerticalLine(right: !(row % 2).toBool())
            guard row < 6 else { return }
            cell.extensionHorizontalLine(top: false)
            
        }.disposed(by: disposeBag)
     
        let itemSelected = menuCollectionView.rx.itemSelected
        itemSelected.subscribe(onNext: { (indexPath) in
            menuViewModel.selectedItem(indexPath: indexPath)
        }).disposed(by: disposeBag)
    }

}
