import UIKit

class VerticalCollectionCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var contentContainerView: UIView!
    
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
