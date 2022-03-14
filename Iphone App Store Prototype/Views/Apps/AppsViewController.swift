import UIKit

enum Section: Int {
    
    // MARK: - Enum cases
    case recommendedApps
    case appsCategories
    var rowCount: Int {
        switch self {
        case .recommendedApps:
            return 1
        case .appsCategories:
            return 3
        }
    }
}

enum SectionItem: Hashable {
    
    // MARK: - Enum cases
    case recommendedApps(RecommendAppsModel)
    case appsCategories(AppsCategoryModel)
}

class AppsViewController: BaseViewController, UIScrollViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet var appsView: AppsView!
    
    // MARK: - Typealises
    typealias Datasource = UICollectionViewDiffableDataSource<Int, SectionItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, SectionItem>
    
    // MARK: - Private Properties
    private var datasource: Datasource?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        configureDatasource()
        generateData(animated: true)
    }
    
    // MARK: - Private Methods
    private func setUpCollectionView() {
        appsView.appsCollectionView.register(RecommendedAppsCell.nibForCollection(), forCellWithReuseIdentifier: RecommendedAppsCell.reuseIdentifierForCollection)
        appsView.appsCollectionView.register(AppsCategoryCell.nibForCollection(), forCellWithReuseIdentifier: AppsCategoryCell.reuseIdentifierForCollection)
        appsView.appsCollectionView.register(RecommendedAppsHeader.nibForHeaderAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecommendedAppsHeader.reuseIdentifierForHeaderAndFooter)
        appsView.appsCollectionView.register(AppsCategoryHeader.nibForHeaderAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsCategoryHeader.reuseIdentifierForHeaderAndFooter)
        appsView.appsCollectionView.register(FooterView.nibForHeaderAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterView.reuseIdentifierForHeaderAndFooter)
        appsView.appsCollectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionLayoutKind = Section(rawValue: sectionIndex) else { return nil }
            let row = sectionLayoutKind.rowCount
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupHeight = row == 1 ? NSCollectionLayoutDimension.absolute(302) : NSCollectionLayoutDimension.absolute(270)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: row)
            let headerHeight = row == 1 ? NSCollectionLayoutDimension.absolute(44) : NSCollectionLayoutDimension.absolute(64)
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: headerHeight)
            let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            let footerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [headerView, footerView]
            section.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
            section.orthogonalScrollingBehavior = .groupPaging
            section.interGroupSpacing = 10
            return section
        }
        return layout
    }
    
    // MARK: - Internal Methods
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.title = scrollView.contentOffset.y > 35 ? LocalizedKey.appsTitle.string : LocalizedKey.emptyString.string
    }
}

extension AppsViewController {
    
    // MARK: configureDatasource
    private func configureDatasource() {
        datasource = Datasource(collectionView: appsView.appsCollectionView, cellProvider: { [unowned self] collectionView, indexPath, item in
            return cell(collectionView: collectionView, indexPath: indexPath, item: item)
        })
        
        datasource?.supplementaryViewProvider = { [unowned self] (collectionView, kind, indexPath) in
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
    
    private func cell(collectionView: UICollectionView, indexPath: IndexPath, item: SectionItem) -> UICollectionViewCell {
        switch item {
        case .recommendedApps(let recommendedApps):
            let cell: RecommendedAppsCell = collectionView.dequeue(for: indexPath)
            cell.setCellDataWith(recommendedApps)
            return cell
        case .appsCategories(let appsCategory):
            let cell: AppsCategoryCell = collectionView.dequeue(for: indexPath)
            cell.setCellDataWith(appsCategory)
            if (indexPath.row + 1) % 3 == 0 {
                cell.hideBottomLine()
            }
            return cell
        }
    }
    
    private func generateData(animated: Bool) {
        var snapshot = Snapshot()
        var sections = Array(0...1)
        snapshot.appendSections(sections)
        snapshot.appendItems(RecommendAppsModel.allRecommendedApps.map(SectionItem.recommendedApps), toSection: sections.first)
        snapshot.appendItems(AppsCategoryModel.allAppsCategories.map(SectionItem.appsCategories), toSection: sections[1])
        datasource?.apply(snapshot, animatingDifferences: animated)
    }
}

