//
//  File.swift
//  
//
//  Created by me on 07/02/2023.
//

import Foundation

public protocol SettingUpViews: SettingUpViewLayout, AnyObject {
    
    func setupViewColors()
    func setupViewProperties()
    func setupViewHierarchy()
}

public extension SettingUpViews {
    
    func setupViews() {
        setupViewProperties()
        setupViewHierarchy()
        setupViewLayout()
        setupViewColors()
    }
    
    func setupViewProperties() {}
    func setupViewHierarchy() {}
    func setupViewLayout() {}
    func setupViewColors() {}
}
