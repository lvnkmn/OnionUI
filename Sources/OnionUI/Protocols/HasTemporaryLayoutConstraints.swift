import Foundation

public protocol HasTemporaryLayoutConstraints {
    
    var temporaryLayoutConstraints: [NSLayoutConstraint?] { get }
}
