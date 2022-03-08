//
//  UIViewController.swift
//  Iphone App Store Prototype
//
//  Created by BrainX IOS on 08/03/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func setNavigationBarBottomLineHidden(_ isHidden: Bool) {
        navigationController?.navigationBar.setValue(isHidden, forKey: "hidesShadow")
    }
}
