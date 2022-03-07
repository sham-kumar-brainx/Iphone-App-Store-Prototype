import Foundation
import UIKit

class HeaderForTableView: UITableViewHeaderFooterView {

    // MARK: - Outlets
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }

    // MARK: - Private Methods
    private func configureView() {
        date.textColor = Color.lightBrownColor
    }

    // MARK: - Internal Methods
    func setDateWith(_ date: String) {
        self.date.text = date
    }

    func setDayNameWith(_ dayName: String) {
        self.dayName.text = dayName
    }

    func setProfileImageWith(_ imageName: String) {
        profileImage.image = UIImage(named: imageName)
    }
}
