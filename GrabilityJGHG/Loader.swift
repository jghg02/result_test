//
//  Loader.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/5/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import UIKit

public protocol LoaderDelegate {
    func loaderCancelOperation(loader: Loader) -> Void
}

public class Loader: NibDesignable {
    public var delegate: LoaderDelegate?
    var mainNavigation: Bool = true
    var view: UIView!
    
    @IBOutlet weak var backgroundOverlay: UIView!
    @IBOutlet weak var logoLoader: UIImageView!
    @IBOutlet weak var iconLoader: UIImageView!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var viewCancel: UIView!
    @IBOutlet weak var cancelLabel: UILabel!
    @IBOutlet weak var iconCancel: UIImageView!
    
    @IBInspectable public var background: UIView! { didSet { self.backgroundOverlay.addSubview(background) } }
    @IBInspectable public var navigation: Bool! { didSet { self.mainNavigation = navigation } }
    @IBInspectable public var loadLogo: UIImage! { didSet { self.logoLoader.image = loadLogo } }
    @IBInspectable public var loadIcon: UIImage! { didSet { self.iconLoader.image = loadIcon } }
    @IBInspectable public var cancelIcon: UIImage! { didSet { self.iconCancel.image = cancelIcon } }
    @IBInspectable public var cancelText: String! { didSet { self.cancelLabel.text = cancelText } }

    
    @IBInspectable public var logoEnable: Bool! {
        didSet {
            if logoEnable == true {
                self.logoLoader.alpha = 1.0
            }
            else {
                self.logoLoader.alpha = 0.0
            }
        }
    }
    
    @IBInspectable public var actionText: String! {
        didSet {
            UIView.transitionWithView(
                self.actionLabel,
                duration: 0.5,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: { () -> Void in
                    self.actionLabel.alpha = 1
                    self.actionLabel.text = self.actionText
                    self.actionLabel.font = UIFont(name: "Geometria", size:22)
                    
                },
                completion: nil
            )
        }
    }
    
    
    //MARK: - Init
    //MARK: -
    
    public init(view: UIView!) {
        super.init(frame: CGRectMake(0, 0, 320, 568))
        self.view = view
        self.initView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Action`s Buttons
    //MARK: -
    
    @IBAction func cancelOperation(sender: AnyObject) {
        self.delegate?.loaderCancelOperation(self)
    }
    
    //MARK: - Functions
    //MARK: -
    
    func initView() {
        let oneView: UIView = LoaderConfig.shared().backgroundOverlay
        AutoLayouts.fillContainer(self.backgroundOverlay, view: oneView)
        
        self.iconLoader.image = LoaderConfig.shared().loaderIcon
        self.iconCancel.image = LoaderConfig.shared().loaderIconCancel
        if LoaderConfig.shared().enableLogo == true {
            self.logoLoader.alpha = 1.0
            self.logoLoader.image = LoaderConfig.shared().logo
        }
        
        //self.actionLabel.font = LoaderConfig.shared().actionLabelFont
        self.actionLabel.textColor = LoaderConfig.shared().fontLabelColor
        self.cancelLabel.textColor = LoaderConfig.shared().fontLabelColor
        
        let rotacion = CABasicAnimation(keyPath: "transform.rotation.z")
        rotacion.toValue = CGFloat(M_PI * 2.0)
        rotacion.duration = 2.0
        rotacion.cumulative = true
        rotacion.repeatCount = 1000
        iconLoader.layer.addAnimation(rotacion, forKey: nil)
    }
    
    public func showInView() -> Loader {
        AutoLayouts.fillContainer(self.mainNavigation == true ? UIApplication.sharedApplication().keyWindow!.subviews.first! : self.view, view: self)
        
        self.alpha = 0
        UIView.animateWithDuration(
            0.3,
            animations: { () -> Void in
                self.alpha = 1.0
            },
            completion: nil
        )
        
        return self
    }
    
    public func removeFromView() -> Void {
        UIView.animateWithDuration(0.3, delay: 0.0, options: .AllowUserInteraction, animations: { () -> Void in
            self.alpha = 0
            }) { (completed) -> Void in
                self.removeFromSuperview()
        }
    }
}

