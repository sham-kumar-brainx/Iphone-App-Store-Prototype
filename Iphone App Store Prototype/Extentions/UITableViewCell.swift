import UIKit

extension UITableViewCell {
    
    // MARK: - Static Properties
    static var reuseIdentifierForTable: String {
        return String(describing: self)
    }
    
    // MARK: - Static Methods
    static func nibForTable() -> UINib {
        return UINib(nibName: self.reuseIdentifierForTable, bundle: nil)
    }
}
