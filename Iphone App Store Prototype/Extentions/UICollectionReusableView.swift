import UIKit

extension UICollectionReusableView {
    
    // MARK: - Static Properties
    static var reuseIdentifierForHeaderAndFooter: String {
        return String(describing: self)
    }
    
    // MARK: - Static Methods
    static func nibForHeaderAndFooter() -> UINib {
        return UINib(nibName: self.reuseIdentifierForHeaderAndFooter, bundle: nil)
    }
}
