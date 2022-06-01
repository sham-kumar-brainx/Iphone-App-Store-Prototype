import UIKit

class AppsCategoryCell: UICollectionViewCell {
    
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
    
    // MARK: - Internal Methods
    func setCellDataWith(_ model: AppsCategoryModel) {
        appName.text = model.appName
        appDescription.text = model.appDescription
        inAppPurchase.text = model.inAppPurchaseStatus
        appIconImage.image = UIImage(named: model.appIconImage)
    }
}
