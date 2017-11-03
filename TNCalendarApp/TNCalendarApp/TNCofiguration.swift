//
//  MPDCofiguration.swift
//  MPD
//
//  Created by 涂育旺 on 2017/6/12.
//  Copyright © 2017年 Qianhai Jiutong. All rights reserved.
//

import UIKit
import RxSwift

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

let widthFor750 = SCREEN_WIDTH/750
let heightFor1334 = SCREEN_HEIGHT/1334
let TABBAR_HEIGHT = heightFor1334*130
let TNPrefix = Bundle.main.infoDictionary?["CFBundleExecutable"] as! String
let BMOBID = "fc65c6ca2f082cac62368c0646e2db09"
let disposeBag = DisposeBag()
let defaultTabbarSelected = 1

public func SFont(font: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: font*widthFor750)
}

public func ImageName(_ imageName: String) -> UIImage? {
    return UIImage.init(named: imageName)
}

func Hex(_ hexStr: String) -> UIColor {
    return UIColor.hex(Hex: hexStr)
}

//func showMessage(msg: String) {
//    let hud = MBProgressHUD(view: UIApplication.shared.keyWindow!)
//    hud.mode = .text
//    hud.label.text = msg
//    hud.show(animated: true)
//    hud.hide(animated: true, afterDelay: 2.0)
//}

///
let Hex1F1F1F = Hex("#1F1F1F")

///
let HexF09738 = Hex("#F09738")

///
let HexFFFFFF = Hex("#FFFFFF")

///
let HexCCCCCC = Hex("#CCCCCC")

///
let Hex999999 = Hex("#999999")

///
let HexF06838 = Hex("#F06838")

///
let Hex808080 = Hex("#808080")

///
let HexF09728 = Hex("#F09728")

///
let HexF5F5F5 = Hex("#F5F5F5")

///
let Hex59a3da = Hex("#59a3da")

///
let Hex0267b5 = Hex("#0267b5")

///
let HexE6E6E6 = Hex("#E6E6E6")

///
let HexF09205 = Hex("#F09205")

///
let HexBDBDBD = Hex("#BDBDBD")

///
let Hex333333 = Hex("#333333")

///
let Hexde4b30 = Hex("#de4b30")

///
let HexFFCE99 = Hex("#FFCE99")

///
let Hex0068b7 = Hex("#0068b7")

///
let Hex009944 = Hex("#009944")

///
let Hexf5f5f5 = Hex("#f5f5f5")

///
let Hex0F0F0F = Hex("#0F0F0F")

///
let HexFBE5CD = Hex("#FBE5CD")

extension Int {
    public func toPixel() -> CGFloat {
        return CGFloat(self)*widthFor750
    }
    
    public func toBool() -> Bool {
        return self != 0
    }
}

extension Float {
    public func toCGFloat() -> CGFloat {
        return CGFloat(self)
    }
}

extension UITableViewCell {
    public func setLineHeight(_ height: Int) {
        let top = max(height, 0)
        let bottom = abs(min(height, 0))
        contentView.snp.updateConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalTo(UIEdgeInsetsMake(top.toPixel(), 0, bottom.toPixel(), 0))
        }
        layoutSubviews()
    }
    
    public func extensionSeparatorLine(equalToSuperView: Bool) {
        guard let _ = contentView.viewWithTag(20171102) else {
            
            let lineView = TNLineView()
            lineView.tag = 20171102
            contentView.addSubview(lineView)
            
            let inset = equalToSuperView ? 0 : 59.toPixel()
            
            lineView.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.leading.equalTo(inset)
                make.trailing.equalTo(-inset)
                make.height.equalTo(2.toPixel())
            }
            return
        }
    }
}

extension UIColor {
    
    open class func hex(Hex hexStr: String) -> UIColor {
        var str = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if str.characters.count < 6 {
            return UIColor.clear
        }
        if str.hasPrefix("0X") {
            str = str.substring(from: str.index(str.startIndex, offsetBy: 2))
        }
        if str.hasPrefix("#") {
            str = str.substring(from: str.index(str.startIndex, offsetBy: 1))
        }
        if str.characters.count != 6 {
            return UIColor.clear
        }
        
        let rIndex = str.index(str.startIndex, offsetBy: 2)
        let rString = str.substring(to: rIndex)
        let otherString = str.substring(from: rIndex)
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = otherString.substring(to: gIndex)
        let bIndex = str.index(str.endIndex, offsetBy: -2)
        let bString = str.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    
    
}

extension UIView {
    
    open var x : CGFloat {
        return self.frame.minX
    }
    
    open var y : CGFloat {
        return self.frame.minY
    }
    
    open var width : CGFloat {
        return self.frame.width
    }
    
    open var height : CGFloat {
        return self.frame.height
    }
    
    func setCornerRadius(position: UIRectCorner) {
        assert(bounds != CGRect.zero)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: position, cornerRadii: bounds.size)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}

extension UICollectionViewCell {
    
    public func extensionVerticalLine(right: Bool) {
        let view = TNLineView()
        contentView.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.width.equalTo(1.toPixel())
            make.top.bottom.equalToSuperview()
            if right {
                make.trailing.equalToSuperview()
            }else
            {
                make.leading.equalToSuperview()
            }
        }
        
    }
    
    public func extensionHorizontalLine(top: Bool) {
        let view = TNLineView()
        contentView.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.height.equalTo(2.toPixel())
            make.leading.trailing.equalToSuperview()
            if top {
                make.top.equalToSuperview().offset(1.toPixel())
            }else
            {
                make.bottom.equalToSuperview().offset(1.toPixel())
            }
        }
    }
}

extension UIApplication {
    
    static func rootViewController() -> MPDTabBarViewController {
        return UIApplication.shared.keyWindow?.rootViewController as! MPDTabBarViewController
    }
    
    static func currentNavigationRootViewController() -> TNBaseViewController {
        
        return UIApplication.currentNavigationViewControllers().first!
    }
    
    static func currentNavigationViewControllers() -> [TNBaseViewController] {
        let rootViewController = UIApplication.rootViewController()
        let navigationController = rootViewController.viewControllers![rootViewController.selectedIndex] as! UINavigationController
        return navigationController.viewControllers as! [TNBaseViewController]
    }
}








