import UIKit

extension UIFont {
    
    // MARK: - Static Methods
    static func customSfUIDisplayBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: FontsName.sfUIDisplayBold, size: size)
    }
    
    static func customSfUIDisplayMedium(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: FontsName.sfUIDisplayMedium, size: size)
    }
    
    static func customSfUITextBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: FontsName.sfUITextBold, size: size)
    }
    
    static func customSfUITextMedium(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: FontsName.sfUITextMedium, size: size)
    }
    
    static func customSfUITextSemibold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: FontsName.sfUITextSemibold, size: size)
    }
}
