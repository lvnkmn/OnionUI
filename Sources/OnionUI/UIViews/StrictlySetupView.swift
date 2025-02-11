//
//  File.swift
//  
//
//  Created by me on 07/02/2023.
//

import UIKit

open class StrictlySetupView: UIView, SettingUpViews {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupViewProperties() {}
    open func setupViewHierarchy() {}
    open func setupViewLayout() {}
    open func setupViewColors() {}
}
