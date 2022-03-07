import UIKit

extension UICollectionViewCell {
    
    // MARK: - Static Properties
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: - Static Methods
    static func nib() -> UINib {
        return UINib(nibName: self.reuseIdentifier, bundle: nil)
    }
}
