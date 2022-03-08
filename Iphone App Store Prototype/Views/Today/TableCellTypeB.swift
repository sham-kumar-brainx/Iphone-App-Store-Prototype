import UIKit

class TableCellTypeB: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var contentContainerView: UIView!
    
    @IBInspectable var cornerRadius: CGFloat = 10

    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.white
    @IBInspectable var shadowOpacity: Float = 0.5
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        contentContainerView.setCornerRadius(10, andClipContent: true)
    }
}
