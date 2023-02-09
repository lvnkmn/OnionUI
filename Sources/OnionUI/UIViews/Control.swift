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
        addGestureRecognizers {
            UITapGestureRecognizer(target: self, action: #selector(didTouchUpInside)).mutate {
                $0.delegate = self
            }
        }
        setupViews()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTouchUpInside() {
        sendActions(for: .touchUpInside)
    }
    
    open func setupViewProperties() {}
    open func setupViewHierarchy() {}
    open func setupViewLayout() {}
    open func setupViewColors() {}
}

extension Control: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        true
    }
}
