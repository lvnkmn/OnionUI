import UIKit
import SourceSeeds

public extension UIScrollView {
    
    @discardableResult
    func addVerticallyScolledContent(_ provideSubview: () -> (UIView)) -> Self {
        provideSubview()
            .use { it in
                addPinnedSubView {
                    it
                }
                it.widthAnchor.constraint(equalTo: widthAnchor).activated()
            }
        return self
    }
}
