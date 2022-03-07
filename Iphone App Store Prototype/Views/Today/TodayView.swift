import UIKit

class TodayView: UIView {
    
    // MARK: - Outlets
    @IBOutlet var todayTableView: UITableView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        formatUIEObjects()
        
    }
    
    // MARK: - Private Methods
    private func formatUIEObjects() {
        todayTableView.separatorStyle = .none
    }
}
