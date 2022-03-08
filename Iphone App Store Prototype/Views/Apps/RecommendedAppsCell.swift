import Foundation
import UIKit

class RecommendedAppsCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var feature: UILabel!
    @IBOutlet weak var appIconImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var appDescription: UILabel!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        appIconImage.setCornerRadius(10.0, andClipContent: true)
    }
    
    // MARK: - Internal Methods
    func setCellDataWith(_ model: RecommendAppsModel) {
        feature.text = model.feature
        appDescription.text = model.appDescription
        title.text = model.appName
        appIconImage.image = UIImage(named: model.appIconImage)
    }
}
