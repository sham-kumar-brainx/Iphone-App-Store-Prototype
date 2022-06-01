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
        todayView.todayTableView.register(HeaderForTableView.nibForView(), forHeaderFooterViewReuseIdentifier: HeaderForTableView.identifierForView)
        todayView.todayTableView.register(TableCellTypeA.nibForTable(), forCellReuseIdentifier: TableCellTypeA.reuseIdentifierForTable)
        todayView.todayTableView.register(TableCellTypeB.nibForTable(), forCellReuseIdentifier: TableCellTypeB.reuseIdentifierForTable)
    }
}

// MARK: - Extention for confroming UITableViewDelegate, UITableViewDataSource
extension TodayViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Internal Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableCellTypeA.reuseIdentifierForTable, for: indexPath) as? TableCellTypeA else {
                fatalError("Xib doesn't exist")
            }
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableCellTypeB.reuseIdentifierForTable, for: indexPath) as? TableCellTypeB else {
                fatalError("Xib doesn't exist")
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderForTableView.identifierForView) as? HeaderForTableView else {
            fatalError("Xib doesn't exist")
        }
        if section > 0 {
            headerView.profileImage.isHidden = true
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 440
    }
}
