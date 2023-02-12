//
//  File.swift
//  
//
//  Created by me on 07/02/2023.
//

import UIKit

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

public extension SettingUpViews where Self: RepresentingView {
    
    func relayout(animator: UIViewPropertyAnimator? = nil) {
        representedView.removeConstraints()
        setupViewLayout()

        animator
            .map {
                $0.addAnimations(representedView.layoutIfNeeded)
                $0.startAnimation()
            } ?? representedView.layoutIfNeeded()
    }
}
