//
//  File.swift
//  
//
//  Created by me on 11/02/2023.
//

import UIKit

public protocol RepresentingView {
    
    var representedView: UIView { get }
}

extension UIViewController: RepresentingView {
    public var representedView: UIView {
        view
    }
}
extension UIView: RepresentingView {
    
    public var representedView: UIView { self }
}
