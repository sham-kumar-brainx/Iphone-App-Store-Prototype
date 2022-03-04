import UIKit

class TodayView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var todayTitle: UILabel!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        formatUIEObjects()
        
    }
    
    // MARK: - Private Methods
    private func formatUIEObjects() {
        date.textColor = Color.lightBrownColor
    }
}
