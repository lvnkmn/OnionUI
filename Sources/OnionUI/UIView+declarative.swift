//
//  File.swift
//  
//
//  Created by Menno Lovink on 31/01/2023.
//

import UIKit
import SourceSeeds
import LazyLayout

public extension UIView {

    @discardableResult
    func layedOutWith(_ configureLayout: (UIView.Layout) -> ()) -> Self {
        configureLayout(layout)
        return self
    }

    @discardableResult
    func layout(_ configureLayout: (UIView.Layout) -> (), forSubviewThatsAdded provideSubView: () -> UIView) -> Self {
        let providedSubView = provideSubView()
        addSubview(providedSubView)
        configureLayout(providedSubView.layout)
        return self
    }

    @discardableResult
    func addSubViews(@ArrayBuilder _ provideSubviews: () -> ([UIView])) -> Self {
        provideSubviews().forEach(addSubview)
        return self
    }

    @discardableResult
    func addSafelyPinnedSubView(_ provideSubview: () -> UIView) -> Self {
        let subview = provideSubview()
        addSubview(subview)
        subview.layout.pin(toEdges: .all, of: safeAreaLayoutGuide)
        return self
    }

    @discardableResult
    func addPinnedSubView(
        pinnedTo pinParent: LayoutConstrainable? = nil,
        withPadding padding: UIEdgeInsets = .zero,
        _ provideSubview: () -> UIView) -> Self {
        let subview = provideSubview()
            
        addSubview(subview)
        subview.layout.pin(toEdges: .all, of: pinParent ?? self, withPadding: padding)

        return self
    }

    @discardableResult
    func deactivateLayout() -> Self {
        constraints.forEach {
            $0.isActive = false
        }

        return self
    }

    @discardableResult
    func activateLayout() -> Self {
        constraints.forEach {
            $0.isActive = true
        }

        return self
    }
}
