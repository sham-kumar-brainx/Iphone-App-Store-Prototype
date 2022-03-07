import Foundation
import UIKit

class HorizontalCollectionCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var primaryTitle: UILabel!
    @IBOutlet weak var secondaryTitle: UILabel!
    @IBOutlet weak var cardDescription: UILabel!
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        primaryTitle.textColor = Color.lightBrownColor
        contentContainerView.setCornerRadius(10, andClipContent: true)
    }
}
