import UIKit
import SourceSeeds

public extension UIStackView {

    @discardableResult
    func verticalize() -> Self {
        axis = .vertical
        return self
    }

    @discardableResult
    func horizontalize() -> Self {
        axis = .horizontal
        return self
    }

    @discardableResult
    func addArrangedSubViews(@ArrayBuilder _ provideSubviews: () -> ([UIView])) -> Self {
        provideSubviews().forEach(addArrangedSubview)
        return self
    }

    @discardableResult
    func setting(allignment: Alignment) -> Self {
        self.alignment = allignment
        return self
    }

    @discardableResult
    func setting(spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }
}
