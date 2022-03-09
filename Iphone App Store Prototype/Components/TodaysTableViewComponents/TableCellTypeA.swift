import UIKit

class TableCellTypeA: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var primaryTitle: UILabel!
    @IBOutlet weak var secondaryTitle: UILabel!
    @IBOutlet weak var cardDescription: UILabel!
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var appImage: UIImageView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        primaryTitle.textColor = Color.lightBrownColor
        contentContainerView.addShadow(color: .gray, alpha: 0.5, x: 0, y: 0, radius: 12)
        appImage.setCornerRadius(10.0, andClipContent: true)
    }
}
