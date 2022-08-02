//
//  UIViewController+makeNav.swift
//  Expenses Tracker
//
//  Created by mohammdreza on 8/2/22.
//

import UIKit

extension UIViewController {
    func addNavigation(title: String, image: String) -> UIViewController {
        
        let nav = UINavigationController(rootViewController: self)
        nav.tabBarItem.image = UIImage(
            systemName: image,
            withConfiguration: UIImage.SymbolConfiguration(scale: .large)
        )
        nav.tabBarItem.title = title
        nav.navigationBar.prefersLargeTitles = true
        return nav
    }
}
