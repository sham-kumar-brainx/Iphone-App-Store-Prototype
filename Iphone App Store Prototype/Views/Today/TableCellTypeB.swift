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
        contentContainerView.layer.shadowColor = UIColor.gray.cgColor
        contentContainerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        contentContainerView.layer.shadowRadius = 12.0
        contentContainerView.layer.shadowOpacity = 0.5
        appImage.layer.cornerRadius = 10
        appImage.clipsToBounds
    }
}
