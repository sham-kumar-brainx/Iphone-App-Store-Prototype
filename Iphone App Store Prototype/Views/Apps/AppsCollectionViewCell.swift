import UIKit

class AppsCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var appIconImage: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appDescription: UILabel!
    @IBOutlet weak var inAppPurchase: UILabel!
    @IBOutlet weak var getButton: UIButton!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        getButton.setCornerRadius(15)
    }
}
