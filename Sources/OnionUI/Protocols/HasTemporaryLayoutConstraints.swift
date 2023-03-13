import UIKit

public protocol HasTemporaryLayoutConstraints {
    
    var temporaryLayoutConstraints: [NSLayoutConstraint?] { get }
}
