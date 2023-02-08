//
//  File.swift
//  
//
//  Created by Menno Lovink on 04/02/2023.
//

import UIKit

open class Control: UIControl, SettingUpViews {

    public private (set) var isHeld: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addGestureRecognizers {
            UITapGestureRecognizer(target: self, action: #selector(didTouchUpInside))
            UILongPressGestureRecognizer(target:self, action: #selector(didTouchDown))
                .mutator.mutate {
                    $0.minimumPressDuration = 0
                }
        }
        setupViews()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTouchDown() {
        isHeld = true
        sendActions(for: .touchDown)
    }
    
    @objc func didTouchUpInside() {
        isHeld = false
        sendActions(for: .touchUpInside)
    }
    
    open func setupViewProperties() {}
    open func setupViewHierarchy() {}
    open func setupViewLayout() {}
    open func setupViewColors() {}
}
