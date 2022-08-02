//
//  MainTabBarController.swift
//  Expenses Tracker
//
//  Created by mohammadreza on 8/2/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        view.backgroundColor = .white
    }
    
    private func setupViewController() {
        viewControllers = [
            expensesList().addNavigation(title: "Expenses", image: "creditcard"),
            friendsList().addNavigation(title: "Friends", image: "person.2")
        ]
    }
    
    private func expensesList() -> ListViewController {
        let expensesList = ListViewController()
        expensesList.title = "Expenses"
        expensesList.service = filed()
        
        return expensesList
    }
    
    private func friendsList() -> ListViewController {
        let friendsList = ListViewController()
        friendsList.title = "Friends"
        return friendsList
    }
}

class filed: ItemService {
    func loadItems(completion: @escaping (Result<[ItemsViewModel], Error>) -> Void) {
        completion(.failure(NSError(domain: "Test", code: 0)))
    }
}
