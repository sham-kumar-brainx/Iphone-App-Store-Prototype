import Foundation
import UIKit

class HorizontalCollectionCell: UICollectionViewCell {
    
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
        appIconImage.clipsToBounds = true
        appIconImage.layer.cornerRadius = 10.0
    }
    
    // MARK: - Internal Methods
    func setCellDataWith(_ model: GameRecommendModel) {
        feature.text = model.feature
        appDescription.text = model.appDescription
        title.text = model.appName
        appIconImage.image = UIImage(named: model.appIconImage)
    }
}
