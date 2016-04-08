//
//  NibDesignableProtocol.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/5/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import UIKit

public protocol NibDesignableProtocol: NSObjectProtocol {
    var nibContainerView: UIView { get }
    
    // MARK: - Nib loading
    func loadNib() -> UIView
    func nibName() -> String
}

extension NibDesignableProtocol {
    // MARK: - Nib loading
    public func loadNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: self.nibName(), bundle: bundle)
        return nib.instantiateWithOwner(self, options: nil)[0] as! UIView
    }
    
    // MARK: - Nib loading
    private func setupNib() {
        let view = self.loadNib()
        self.nibContainerView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        self.nibContainerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[view]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views: bindings))
        self.nibContainerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[view]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views: bindings))
    }
}

extension UIView {
    public var nibContainerView: UIView {
        get {
            return self
        }
    }
    
    public func nibName() -> String {
        return self.dynamicType.description().componentsSeparatedByString(".").last!
    }
}

@IBDesignable
public class NibDesignable: UIView, NibDesignableProtocol {
    convenience public init() {
        self.init()
        self.setupNib()
    }
    
    // MARK: - Initializer
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    // MARK: - NSCoding
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
}

@IBDesignable
public class NibDesignableTableViewCell: UITableViewCell, NibDesignableProtocol {
    public override var nibContainerView: UIView {
        get {
            return self.contentView
        }
    }
    
    // MARK: - Initializer
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupNib()
    }
    
    // MARK: - NSCoding
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
}

@IBDesignable
public class NibDesignableControl: UIControl, NibDesignableProtocol {
    
    // MARK: - Initializer
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    // MARK: - NSCoding
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
}

@IBDesignable
public class NibDesignableCollectionViewCell: UICollectionViewCell, NibDesignableProtocol {
    public override var nibContainerView: UIView {
        get {
            return self.contentView
        }
    }
    
    // MARK: - Initializer
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    // MARK: - NSCoding
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
}

