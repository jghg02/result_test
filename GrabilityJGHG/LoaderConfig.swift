//
//  LoaderConfig.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/5/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import UIKit

public class LoaderConfig: NSObject {
    
    public var backgroundOverlay: UIView {
        get {
            let view = UIView()
            view.enableBlur(true)
            view.blurTintColorIntensity = 0.35
            view.blurStyle = UIViewBlurStyle.DarkStyle
            view.blurTintColor = UIColor.blackColor()
            return view
        }
    }
        
    public var enableLogo: Bool? { get { return false } }
    public var logo: UIImage? { get { return UIImage() } }
    public var loaderAnimation: String? { get { return "default" } }
    public var loaderIcon: UIImage {
        get {
            return UIImage(named: "loaderImage.png")!
        }
    }
    public var loaderIconCancel: UIImage? { get { return UIImage() } }
    
    public var fontLabelColor: UIColor? { get { return UIColor.whiteColor() } }
    
    //public var actionLabelFont: UIFont? { get { return UIFont(name: Globals.shared().fontOfSystem("semibold")!, size: UIDevice.currentDevice().userInterfaceIdiom == .Pad ? 20 : 16) } }
    //public var cancelLabelFont: UIFont? { get { return UIFont(name: Globals.shared().fontOfSystem("regular")!, size: UIDevice.currentDevice().userInterfaceIdiom == .Pad ? 18 : 14) } }
    
    //MARK: - Functions
    //MARK: -
    
    struct StaticData { static var sharedInstance: LoaderConfig? }
    
    public class func shared() -> LoaderConfig {
        if StaticData.sharedInstance == nil {
            StaticData.sharedInstance = LoaderConfig()
        }
        return StaticData.sharedInstance!
    }
    
    public class func setShared(shared : LoaderConfig) {
        StaticData.sharedInstance = shared
    }
}
