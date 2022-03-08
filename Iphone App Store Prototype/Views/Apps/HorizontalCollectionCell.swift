import Foundation
import UIKit

class HorizontalCollectionCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var feature: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var appDescription: UILabel!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        image.clipsToBounds = true
        image.layer.cornerRadius = 10.0
    }
}
