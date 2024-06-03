//
//  UIView+tappable.swift
//  MidiJ
//
//  Created by me on 03/06/2024.
//

import UIKit
import OnionUI

public extension UIView {
    func tappable(_ onTap: @escaping () -> ()) -> Control {
        .init()
        .addPinnedSubView{
            self
        }
        .use { it in
            it.addAction(
                .init(handler: { _ in
                    onTap()
                }),
                for: .touchUpInside
            )
        }
    }
}
