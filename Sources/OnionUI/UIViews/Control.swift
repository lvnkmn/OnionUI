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
            UITapGestureRecognizer(target: self, action: #selector(didTouchUpInside)).mutator.mutate {
                $0.delegate = self
            }
            UILongPressGestureRecognizer(target:self, action: #selector(didTouchDown(usingRecognizer:)))
                .mutator.mutate {
                    $0.minimumPressDuration = 0
                    $0.delegate = self
                }
        }
        setupViews()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTouchDown(usingRecognizer recognizer: UIGestureRecognizer) {
        guard recognizer.state == .began else { return }
        
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

extension Control: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        true
    }
}
