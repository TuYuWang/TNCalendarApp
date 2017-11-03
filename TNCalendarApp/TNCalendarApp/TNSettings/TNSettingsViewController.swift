//
//  TNSettingsViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/26.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import RxSwift
import ImagePicker
import Lightbox
import RxDataSources

class TNSettingsViewController: TNBaseViewController {

    var settingsTableView: UITableView!
    private var settingsViewModel: TNSettingsViewModel!
    private var headBackgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SETTINGS"
        
        setContentViewBottomToSuper()
        
        setupUI()
    }

    fileprivate func setupUI() {
        
        settingsViewModel = TNSettingsViewModel(viewController: self)
        
        //head image background
        headBackgroundImageView = UIImageView(image: ImageName("AvatarMask"))
        headBackgroundImageView.frame = CGRect(x: 0, y: -500.toPixel(), width: SCREEN_WIDTH, height: 500.toPixel())
        headBackgroundImageView.contentMode = .scaleAspectFill
        headBackgroundImageView.layer.masksToBounds = true
        headBackgroundImageView.isUserInteractionEnabled = true
        
        
        //caramer
        let caramerButton = UIButton(type: .custom)
        caramerButton.setImage(ImageName("AddPhotoButton"), for: .normal)
        headBackgroundImageView.addSubview(caramerButton)
        
        caramerButton.snp.makeConstraints { (make) in
            make.leading.equalTo(40.toPixel())
            make.bottom.equalTo(-40.toPixel())
        }
        caramerButton.rx.tap.subscribe(onNext: { [weak self]_ in
            let imagePickerController = ImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.imageLimit = 1
            self?.present(imagePickerController, animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        
        //settings tableView
        settingsTableView = UITableView()
        settingsTableView.backgroundColor = .clear
        settingsTableView.separatorStyle = .none
        settingsTableView.rowHeight = 115.toPixel()
        settingsTableView.contentInset = UIEdgeInsetsMake(500.toPixel(), 0, 0, 0)
        settingsTableView.register(TNSettingsTableViewCell.self, forCellReuseIdentifier: "cell")
        settingsTableView.register(TNSettingsTableViewHeader.self, forCellReuseIdentifier: "head")
        view.addSubview(settingsTableView)
        
        settingsTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        settingsTableView.addSubview(headBackgroundImageView)
       

//        settingsViewModel.items.bind(to: settingsTableView.rx.items(dataSource: dataSource))
        
//        settingsViewModel.items.bind(to: settingsTableView.rx.items(cellIdentifier: "cell", cellType: TNSettingsTableViewCell.self)){ (row, element, cell) in
//            cell.keyLabel.text = element.keys.first
//            cell.valueTextField.text = element.values.first
//            if row != 0 { cell.extensionSeparatorLine(equalToSuperView: false) }
//
//            }.disposed(by: disposeBag)
        
        let dataSource = RxTableViewSectionedReloadDataSource<SettingsModel>(configureCell:
        { ds, tv, ip, item in

            if ip.row == 0 {
                let cell = tv.dequeueReusableCell(withIdentifier: "head", for: ip) as! TNSettingsTableViewHeader
                cell.titleLabel.text = item.title
                
                return cell
            }else {
                let cell = tv.dequeueReusableCell(withIdentifier: "cell", for: ip) as! TNSettingsTableViewCell
                cell.keyLabel.text = item.title
                cell.valueTextField.text = item.content
                cell.extensionSeparatorLine(equalToSuperView: ip.row == 1)
                return cell
            }
        })
        
        settingsViewModel.model
            .bind(to: settingsTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        settingsTableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        

    }
    
    

}

extension TNSettingsViewController: ImagePickerDelegate {
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard images.count > 0 else { return }
        
        let lightboxImages = images.map {
            return LightboxImage(image: $0)
        }
        
        let lightbox = LightboxController(images: lightboxImages, startIndex: 0)
        imagePicker.present(lightbox, animated: true, completion: nil)
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        headBackgroundImageView.image = images.first
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}

extension TNSettingsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120.toPixel() : 115.toPixel()
    }
    
    
    
}
