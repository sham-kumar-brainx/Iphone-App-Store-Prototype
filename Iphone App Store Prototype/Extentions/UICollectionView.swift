//
//  UICollectionView.swift
//  Iphone App Store Prototype
//
//  Created by BrainX IOS on 14/03/2022.
//

import Foundation
import UIKit

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifierForCollection, for: indexPath) as! T
    }
}
