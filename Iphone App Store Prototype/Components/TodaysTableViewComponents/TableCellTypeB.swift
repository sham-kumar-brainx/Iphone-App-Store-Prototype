import UIKit

class TableCellTypeB: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var appTitle: UILabel!
    
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        contentContainerView.addShadow(color: .gray, alpha: 0.5, x: 0, y: 0, radius: 12)
        appImage.setCornerRadius(10.0, andClipContent: true)
    }
}
