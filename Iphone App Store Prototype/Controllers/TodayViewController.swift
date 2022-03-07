import UIKit

class TodayViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet var todayView: TodayView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    // MARK: - Private Methods
    private func setUpTableView() {
        todayView.todayTableView.register(HeaderForTableView.nibForTableHeaderFooter(), forHeaderFooterViewReuseIdentifier: HeaderForTableView.identifierForTableHeaderFooter)
        todayView.todayTableView.register(HorizontalCollectionCell.nibForTable(), forCellReuseIdentifier: HorizontalCollectionCell.reuseIdentifierForTable)
        todayView.todayTableView.register(VerticalCollectionCell.nibForTable(), forCellReuseIdentifier: VerticalCollectionCell.reuseIdentifierForTable)
    }
}

// MARK: - UITableViewDelegate

extension TodayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 440
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HorizontalCollectionCell.reuseIdentifierForTable, for: indexPath) as? HorizontalCollectionCell else { fatalError("xib doesn't exist")
            }
            return cell

        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: VerticalCollectionCell.reuseIdentifierForTable, for: indexPath) as? VerticalCollectionCell else { fatalError("xib doesn't exist")
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderForTableView.identifierForTableHeaderFooter) as? HeaderForTableView else {
            fatalError("xib doesn't exist")
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 62
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
}
