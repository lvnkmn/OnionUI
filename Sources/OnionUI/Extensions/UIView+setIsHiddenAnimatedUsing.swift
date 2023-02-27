//
//  File.swift
//  
//
//  Created by me on 27/02/2023.
//

import UIKit

public extension UIView {
    
    private struct AnimationStates<T> {
        let start: T
        let end: T
    }
    
    private struct AnimationProperties {
        let isHidden: AnimationStates<Bool?>
        let alpha: AnimationStates<CGFloat?>
    }
    
    func set(isHidden shouldHide: Bool, animatedUsing animator: UIViewPropertyAnimator = .init(duration: 0.5, curve: .easeInOut)) {
        let animationProperties: AnimationProperties = shouldHide ?
            .init(isHidden: .init(start: nil, end: shouldHide), alpha: .init(start: nil, end: 0)) :
            .init(isHidden: .init(start: shouldHide, end: nil), alpha: .init(start: 0, end: 1))
        
        animationProperties.alpha.start.whenNotNil { self.alpha = $0 }
        animationProperties.isHidden.start.whenNotNil { self.isHidden = $0 }
        
        animator.addAnimations {
            animationProperties.alpha.end.whenNotNil { self.alpha = $0 }
        }
        animator.addCompletion { _ in
            animationProperties.isHidden.end.whenNotNil { self.isHidden = $0 }
        }
        animator.startAnimation()
    }
}
