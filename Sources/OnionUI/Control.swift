//
//  File.swift
//  
//
//  Created by Menno Lovink on 04/02/2023.
//

import UIKit

open class Control: UIControl {

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        sendActions(for: .touchUpInside)
    }
}
