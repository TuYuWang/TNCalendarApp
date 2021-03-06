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
import Kingfisher
import RxCocoa

class TNSettingsViewController: TNBaseViewController {

    var settingsTableView: UITableView!
    private var settingsViewModel: TNSettingsViewModel!
    private var headBackgroundImageView: UIImageView!
    private var userInfo: TNUserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SETTINGS"
        
        setItemType(left: .menu, right: .logout)
        
        settingsViewModel = TNSettingsViewModel(viewController: self)

        userInfo = TNUserInfo(user: BmobUser.current())

        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingsViewModel.update()
        userInfo = TNUserInfo(user: BmobUser.current())
    }
    
    fileprivate func setupUI() {
        
        //head image background
        headBackgroundImageView = UIImageView()
        headBackgroundImageView.frame = CGRect(x: 0, y: -500.toPixel(), width: SCREEN_WIDTH, height: 500.toPixel())
        headBackgroundImageView.contentMode = .scaleAspectFill
        headBackgroundImageView.layer.masksToBounds = true
        headBackgroundImageView.isUserInteractionEnabled = true
        headBackgroundImageView.kf.setImage(with: URL(string: userInfo.headImagePath), placeholder: ImageName("AvatarMask"))
        
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
        settingsTableView.showsVerticalScrollIndicator = false
        settingsTableView.rowHeight = 115.toPixel()
        settingsTableView.contentInset = UIEdgeInsetsMake(500.toPixel(), 0, 130.toPixel(), 0)
        settingsTableView.register(TNSettingsTableViewCell.self, forCellReuseIdentifier: "cell")
        settingsTableView.register(TNSettingsTableViewHeader.self, forCellReuseIdentifier: "head")
        view.addSubview(settingsTableView)
        
        settingsTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        settingsTableView.addSubview(headBackgroundImageView)
       
        
        //save button
        let saveButton = TNBottomButton(type: .rootView)
        saveButton.setTitle("SAVE", for: .normal)
        view.addSubview(saveButton)
        
        saveButton.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(SCREEN_HEIGHT-130.toPixel(), 0, 0, 0))
        }
        
        saveButton.rx.tap.subscribe(onNext: {[weak self] _ in
            self?.settingsViewModel.update(background: (self?.userInfo)!)
            
        }).disposed(by: disposeBag)
        
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
                
                let allValid = cell.valueTextField.rx.text.orEmpty
                    .map { $0.characters.count >= 4 }
                    .share(replay: 1)
                
                allValid
                    .bind(to: saveButton.rx.isEnabled)
                    .disposed(by: disposeBag)
                
                cell.valueTextField.rx.text.changed.subscribe(onNext: { [weak self](text) in
                    if ip.row == 1 {
                        self?.userInfo.info.username = text
                    }else if ip.row == 3 {
                        self?.userInfo.info.password = text
                        self?.userInfo.info.setObject(text, forKey: "psd")
                    }else {
                        self?.userInfo.info.setObject(text, forKey: item.title.lowercased())
                    }
                }).disposed(by: disposeBag)
                
                return cell
            }
        })
    
        settingsViewModel.model.asObservable()
            .bind(to: settingsTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        settingsTableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        // TODO: Blog
        //-314 -194.5
        settingsTableView.rx.contentOffset.subscribe(onNext: {[weak self] (offset) in
            print(offset.y)
            saveButton.alpha = min(1, (abs(offset.y)-314.0)/(-119.5))
            self?.setContentViewBottomToSuper(offset: (abs(offset.y)-314.0))
            let edge = min(130.toPixel(), (314.0-(abs(offset.y)))*widthFor750)
            
            saveButton.snp.updateConstraints { (make) in
                make.edges.equalTo(UIEdgeInsetsMake(SCREEN_HEIGHT-edge, 0, 0, 0))
            }
            self?.settingsTableView.snp.updateConstraints({ (make) in
                make.edges.equalTo(UIEdgeInsetsMake(0, 0, edge, 0))
            })
            
        }).disposed(by: disposeBag)
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
        userInfo.headImageData = BmobFile(fileName: "\(userInfo.name).png", withFileData: UIImagePNGRepresentation(images.first!))
        settingsViewModel.update(headImage: userInfo)
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
