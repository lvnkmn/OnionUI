//
//  File.swift
//  
//
//  Created by Menno Lovink on 03/02/2023.
//

import UIKit

public extension UILabel {

    @discardableResult
    func setting(text: String) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    func setting(font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func setting(textColor: UIColor) -> Self {
        self.textColor = textColor
        return self
    }
}
