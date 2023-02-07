//
//  File.swift
//  
//
//  Created by Menno Lovink on 04/02/2023.
//

import UIKit

open class Control: UIControl, SettingUpViews {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        setupViews()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTap() {
        sendActions(for: .touchUpInside)
    }
    
    open func setupViewProperties() {}
    open func setupViewHierarchy() {}
    open func setupViewLayout() {}
    open func setupViewColors() {}
}
