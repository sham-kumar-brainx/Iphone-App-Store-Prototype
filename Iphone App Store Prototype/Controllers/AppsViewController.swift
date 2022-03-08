import UIKit

enum Section: Int {
    
    // MARK: - Enum cases
    case recommendedApps
    case appsCategories
}

class AppsViewController: BaseViewController, UIScrollViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet var appsView: AppsView!
    
    // MARK: - Private Properties
    private var gameTopicList = AppsCategoryViewModel().appsCategoryList
    private var gameRecommandList = RecommandAppsViewModel().recommandAppsList
    private lazy var compositionalLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self]
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            switch Section(rawValue: sectionIndex) {
            case .recommendedApps:
                return self?.setupHorizontalScrollSection()
            case .appsCategories:
                return self?.setupVerticalScrollSection()
            case .none:
                fatalError("Should not be none")
            }
        }
        return layout
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    // MARK: - Private Methods
    private func setUpCollectionView() {
        appsView.appsCollectionView.register(RecommendedAppsCell.nibForCollection(), forCellWithReuseIdentifier: RecommendedAppsCell.reuseIdentifierForCollection)
        appsView.appsCollectionView.register(AppsCategoryCell.nibForCollection(), forCellWithReuseIdentifier: AppsCategoryCell.reuseIdentifierForCollection)
        appsView.appsCollectionView.register(RecommendedAppsHeader.nibForHeaderAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecommendedAppsHeader.reuseIdentifierForHeaderAndFooter)
        appsView.appsCollectionView.register(AppsCategoryHeader.nibForHeaderAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsCategoryHeader.reuseIdentifierForHeaderAndFooter)
        appsView.appsCollectionView.register(FooterView.nibForHeaderAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterView.reuseIdentifierForHeaderAndFooter)
        appsView.appsCollectionView.collectionViewLayout = compositionalLayout
    }
    
    // MARK: - Internal Methods
    func setupHorizontalScrollSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .absolute(302)), subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        let footerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        section.boundarySupplementaryItems = [headerView, footerView]
        section.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 16.0, bottom: -15.0, trailing: 16.0)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 8
        return section
    }
    
    func setupVerticalScrollSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .absolute(270)), subitem: item, count: 3)
        let section = NSCollectionLayoutSection(group: group)
        let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(64)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        let footerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        section.boundarySupplementaryItems = [headerView, footerView]
        section.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 10
        return section
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 35 {
            self.title = LocalizedKey.appsTitle.string
        } else {
            self.title = LocalizedKey.emptyString.string
        }
    }
}

// MARK: - Extention for confroming UICollectionViewDataSource
extension AppsViewController: UICollectionViewDataSource {
    
    // MARK: - Internal Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .recommendedApps:
            return gameRecommandList.count
        case .appsCategories:
            return gameTopicList.count
        case .none:
            fatalError("Should not be none")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch Section(rawValue: indexPath.section) {
        case .recommendedApps:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedAppsCell.reuseIdentifierForCollection, for: indexPath as IndexPath) as! RecommendedAppsCell
            cell.setCellDataWith(gameRecommandList[indexPath.row])
            return cell
        case .appsCategories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsCategoryCell.reuseIdentifierForCollection, for: indexPath) as! AppsCategoryCell
            cell.setCellDataWith(gameTopicList[indexPath.row])
            return cell
        case .none:
            fatalError("Should not be none")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            switch Section(rawValue: indexPath.section) {
            case .recommendedApps:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecommendedAppsHeader.reuseIdentifierForHeaderAndFooter, for: indexPath) as! RecommendedAppsHeader
                return headerView
            case .appsCategories:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsCategoryHeader.reuseIdentifierForHeaderAndFooter, for: indexPath) as! AppsCategoryHeader
                return headerView
            case .none:
                fatalError("Should not be none")
            }
        } else {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterView.reuseIdentifierForHeaderAndFooter, for: indexPath) as! FooterView
            return footerView
        }
    }
}
