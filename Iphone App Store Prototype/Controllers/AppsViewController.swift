import UIKit

class AppsViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet var appsView: AppsView!
    
    var storedOffsets = [Int: CGFloat]()
    
    //     MARK: - Private Properties
    private lazy var compositionalLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self]
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            switch Section(rawValue: sectionIndex) {
            case .horizontalScroll:
                return self?.setupHorizontalScrollSection()
            case .verticalScroll:
                return self?.setupVerticalScrollSection()
            case .none:
                fatalError(LocalizedKey.noneError.string)
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
        appsView.appsCollectionView.register(HorizontalCollectionCell.nib(), forCellWithReuseIdentifier: HorizontalCollectionCell.reuseIdentifier)
        appsView.appsCollectionView.register(AppsCollectionViewCell.nib(), forCellWithReuseIdentifier: AppsCollectionViewCell.reuseIdentifier)
        appsView.appsCollectionView.register(HeaderCollectionReusableView.nibForHeaderAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseIdentifierForHeaderAndFooter)
        appsView.appsCollectionView.register(AppsCategoryHeader.nibForHeaderAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsCategoryHeader.reuseIdentifierForHeaderAndFooter)
        appsView.appsCollectionView.register(FooterCollectionReuseableView.nibForHeaderAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReuseableView.reuseIdentifierForHeaderAndFooter)
        appsView.appsCollectionView.collectionViewLayout = compositionalLayout
    }
    
    // MARK: - Internal Methods
    func setupHorizontalScrollSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .absolute(302)), subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 16.0, bottom: -15.0, trailing: 16.0)
        let headerView = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44)),
            elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        let footerView = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(50)),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom)
        section.boundarySupplementaryItems = [headerView, footerView]
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    func setupVerticalScrollSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0)))
        //        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 15)
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .absolute(270)), subitem: item, count: 3)
        //        group.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 16.0)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        
        let headerView = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(64)),
            elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        let footerView = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(50)),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom)
        section.boundarySupplementaryItems = [headerView, footerView]
        
        section.orthogonalScrollingBehavior = .groupPaging
        return section
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
        case .horizontalScroll:
            return 3
        case .verticalScroll:
            return 10
        case .none:
            fatalError(LocalizedKey.noneError.string)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch Section(rawValue: indexPath.section) {
        case .horizontalScroll:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionCell.reuseIdentifier, for: indexPath as IndexPath) as! HorizontalCollectionCell
            //            cell.setCellData(with: horizentalItemListData[indexPath.row])
            return cell
        case .verticalScroll:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsCollectionViewCell.reuseIdentifier, for: indexPath) as! AppsCollectionViewCell
            //            cell.setCellData(with: verticalItemListData[indexPath.row])
            return cell
        case .none:
            fatalError(LocalizedKey.noneError.string)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            switch Section(rawValue: indexPath.section) {
            case .horizontalScroll:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseIdentifierForHeaderAndFooter, for: indexPath) as! HeaderCollectionReusableView
                return headerView
            case .verticalScroll:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsCategoryHeader.reuseIdentifierForHeaderAndFooter, for: indexPath) as! AppsCategoryHeader
                return headerView
            case .none:
                fatalError(LocalizedKey.noneError.string)
            }
        } else {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReuseableView.reuseIdentifierForHeaderAndFooter, for: indexPath) as! FooterCollectionReuseableView
            return footerView
        }
    }
}

extension AppsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 35 {
            self.title = "Apps"
        } else {
            self.title = ""
        }
    }
}
