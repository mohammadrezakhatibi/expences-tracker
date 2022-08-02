//
//  MainTabBarController.swift
//  Expenses Tracker
//
//  Created by mohammdreza on 8/2/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewContoller()
        view.backgroundColor = .white
    }
    
    private func setupViewContoller() {
        viewControllers = [
            expencesList().addNavigation(title: "Expenses", image: "creditcard"),
            friendsList().addNavigation(title: "Friends", image: "person.2")
        ]
    }
    
    private func expencesList() -> UIViewController {
        let expencesList = UIViewController()
        expencesList.title = "Expenses"
        
        return expencesList
    }
    
    private func friendsList() -> UIViewController {
        let friendsList = UIViewController()
        friendsList.title = "Friends"
        
        return friendsList
    }
}
