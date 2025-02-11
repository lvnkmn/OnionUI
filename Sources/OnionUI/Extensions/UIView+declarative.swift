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
    func layedOutWith(_ configureLayout: (_ layout: UIView.Layout) -> ()) -> Self {
        configureLayout(layout)
        return self
    }

    @discardableResult
    func layout(_ configureLayout: (_ layout: UIView.Layout) -> (), forSubviewThatsAdded provideSubView: () -> UIView) -> Self {
        let providedSubView = provideSubView()
        addSubview(providedSubView)
        configureLayout(providedSubView.layout)
        return self
    }

    @discardableResult
    func addSubViews(@NilFilteredArrayBuilder _ provideSubviews: () -> ([UIView])) -> Self {
        provideSubviews().forEach(addSubview)
        return self
    }
    
    @discardableResult
    func addGestureRecognizers(@ArrayBuilder _ provideGestureRecognizers: () -> ([UIGestureRecognizer])) -> Self {
        provideGestureRecognizers().forEach(addGestureRecognizer)
        return self
    }

    @discardableResult
    func addPinnedSubView(
        pinnedTo pinParent: LayoutConstrainable? = nil,
        edges: [UIView.Layout.Edge] = .all,
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
    
    @discardableResult
    func archiveLayout() -> Self {
        constraints.forEach {
            $0.archived()
        }

        return self
    }
    
    @discardableResult
    func removeConstraints() -> Self {
        removeConstraints(constraints)
        return self
    }
    
    @discardableResult
    func setting(layerCornerRadius cornerRadius: CGFloat) -> Self {
        self.layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    func setting(layerBorderWidth borderWidth: CGFloat) -> Self {
        self.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    func setting(layerBorderColor borderColor: UIColor) -> Self {
        self.layer.borderColor = borderColor.cgColor
        return self
    }
    
    @discardableResult
    func setting(backgroundColor: UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    func setting(clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    func verticalyScollable() -> UIScrollView {
        UIScrollView()
            .addVerticallyScolledContent {
                self
            }
    }
}
